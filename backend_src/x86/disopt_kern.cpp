#include <memory>
#include <forward_list>
#include <unordered_set>
#include <cassert>
#include <algorithm>
#include "headerlib/RangeIterator.h"
#include "disopt_kern.h"
#include "test.h"
#include "c_codegen.h"
#include "utility.h"
#include "x86/dis_op_process.h"

using namespace std;

/*
The goal here is to decompose a hardware independent directed acyclic graph of operations
into a hardware-dependent sequence of processes (which may in turn contain parrelell
processes).

Current idea is to do this from the ground up. Vector parrelell, then instruction parrelell, then
thread parrelell, then later processor parrelell, and higher levels of that.

Hypothetis, this should be both faster and better.


Benefits:

* Moving things around to fit process specifications is more expensive at lower levels, and so calculating them first should be more optimal.
* Code locatlity is more important at lower levels as well.
* Higher levels will have fewer nodes to traverse, possibly even allowing quadratic time otpimization algorithms.

Benefits for Top Down:
* Lower level optimizations may be allowed to be quadratic time
* May be easier to implement, may end up being more efficient



Ok, here is the action plan:

Graphs: Things like processes, threads, vector path groups and maybe even cache-locality clusters will all have their own collection of nodes and abstract memory.
They will interact with their outside abstract memory by special processes, which will depend on the type of optimization involved, but which will remember the outer
index much like kernel input and output.

These graphs will allow for easy insertion/delete of nodes/memory, so that broader groups can easily be split down into smaller ones.

Processes: No shared memory, regular graph, assume liniar speedup of computation, maximize set_count_ind, minimize set_count_shared.
Threads: Shared memory, regular graph, maybe not assume liniar speedup of comp
Vector path groups: Tricky, not sure yet what to do,
cache-locality clusters: maximizing set_count_shared, minimize set_count_ind, may be implemented just by aranging the nodes in a particular order.

Then figure out how to optimize loops, possibly at the same time as cache-locaty because of the cache-locality/code-locality interaction, or perhaps after it.

Then simply find patterns in the code, and generate the loops! Things with no discernable pattern will get indexes and read them in from an array.
*/


disopt_kern::disopt_kern(std::string inname,
             GraphBuilder & graph,
             marker_g new_in_nodes,
             marker_g final_out_nodes,
             marker_g inter_in_nodes,
             marker_g inter_out_nodes,
             marker_g const_nodes):
    basic_kernel(inname,graph,new_in_nodes,final_out_nodes,inter_in_nodes,inter_out_nodes,const_nodes){
    parrelelize();
}
size_t num_outputs(compute_node & node,vector<abst_memory> & mem){
    uint64_t count = 0;
    for(size_t memout : node.memoutputs){
        count += mem[memout].compdestids.size();
    }
    return count;
}

void cmp_depend_setter(vector<uint8_t> & cmp_depend,compute_node & cmp,comp_graph & graph){
    //todo: recursion depth currently at liniar with problem size, could easily crash
    if(!cmp_depend[cmp.nodeidx]){
        cmp_depend[cmp.nodeidx] = true;
        
        for(size_t memin : cmp.meminputs){
            cmp_depend_setter(cmp_depend,graph.nodes[graph.mem[memin].compnodeidx],graph);
        }
    }
}
vector<uint8_t> get_cmp_depend(compute_node & cmpnode,comp_graph & graph){
    vector<uint8_t> cmp_depend(graph.nodes.size(),false);
    cmp_depend_setter(cmp_depend,cmpnode,graph);
    return cmp_depend;
}
void set_count_ind(vector<uint8_t> & cmp_depend,vector<uint8_t> & is_counted,vector<double> & ind_count,compute_node & root,comp_graph & graph){
    //if cmp_depend[root.nodeidx] is true, then it is zero count, as expected
    //todo: recursion depth currently at liniar with problem size, could easily crash
    if(!is_counted[root.nodeidx] && !cmp_depend[root.nodeidx]){
        is_counted[root.nodeidx] = true;
        
        double rootindcount = 1;//the current node is not dependendent, so it is 1
        for(size_t memid : root.meminputs){
            size_t nextidx = graph.mem[memid].compnodeidx;
            set_count_ind(cmp_depend,is_counted,ind_count,graph.nodes[nextidx],graph);
            rootindcount += ind_count[nextidx];
        }
        ind_count[root.nodeidx] = rootindcount / num_outputs(root,graph.mem);
    }
}

vector<double> aprox_ind_nodes_count(compute_node & cmpend,vector<compute_node> & ends,comp_graph & graph){
    /*
      Approximation of the number of nodes on each compute_node of ends with cmpend.      
      
      Use only for comparison and descisions betwen ends, not for any sort of rigourous cost analysis.
      
      Approximation works as follows:      
    */
    vector<uint8_t> already_computed = get_cmp_depend(cmpend,graph);
    
    vector<double> ind_count(graph.nodes.size(),0);
    
    vector<uint8_t> is_counted(graph.nodes.size(),false);
    
    for(compute_node & endnode : ends){
        set_count_ind(already_computed,is_counted,ind_count,endnode,graph);
    }
    return ind_count;
}

void set_count_shared(vector<uint8_t> & cmp_depend,vector<uint8_t> & is_counted,vector<double> & shared_count,compute_node & root,comp_graph & graph){
    if(!is_counted[root.nodeidx]){
        is_counted[root.nodeidx] = true;
        
        size_t num_outs = num_outputs(root,graph.mem);
        if(cmp_depend[root.nodeidx]){
            shared_count[root.nodeidx] = 1.0 / num_outs;
        }
        else{
            double rootindcount = 0;//the current node is not dependendent, so it is 1
            for(size_t memid : root.meminputs){
                size_t nextidx = graph.mem[memid].compnodeidx;
                set_count_shared(cmp_depend,is_counted,shared_count,graph.nodes[nextidx],graph);
                rootindcount += shared_count[nextidx];
            }
            shared_count[root.nodeidx] = rootindcount / num_outs;
        }
    }
}
vector<double> shared_read_counts(compute_node & cmpend,vector<compute_node> & ends,comp_graph & graph){
    /*
      Aproximamoretion of shared reads value described in docs across all ends. 
      Although imperfect, it can, used iteravly, adjusting values along the way, find squares on matrix multiplication, and that is good enough for me.
      
      However, it may not be good enough for a thourough cost analisis.
      
      Is good enough to find the best group, but there may be a better way to check the cost of the best 
      group when gotten.
    */
    vector<uint8_t> cmp_depend = get_cmp_depend(cmpend,graph);
    
    vector<double> shared_count(graph.nodes.size(),0.0);
    vector<uint8_t> is_counted(graph.nodes.size(),false);
    
    for(compute_node & endnode : ends){
        set_count_shared(cmp_depend,is_counted,shared_count,endnode,graph);
    }
    return shared_count;
}

void disopt_kern::parrelelize(){
    size_t finoutsize = inter_outs.size()+fin_outs.size();
    vector<compute_node> outputs(graph.nodes.rbegin(),graph.nodes.rbegin()+finoutsize);
    vector<double> shared_counts = shared_read_counts(outputs[0],outputs,graph);
}

std::string disopt_kern::to_string(){
    size_t max_stored_idx = max(*max_element(inter_ins.begin(),inter_ins.end()),*max_element(inter_outs.begin(),inter_outs.end()));
    sequencial::code_sequ sequ = code_loopization(graph,max_stored_idx);
    
    string result;
    for(sequencial::code_item & ci : sequ){
        assert(ci.proc.get_type() == sequencial::LOOP);
        result += loop_to_string(ci.proc.loop());
    }
    
    return result;
}



//class proc_series:
//    public process{
//public:
//    vector<process *> procs;
//    proc_series(uint64_t in_unique_id,oper op):
//        process(in_unique_id){
//    }
//    virtual double cost(){
//        double sum = 0;
//        for(process * proc : procs){
//            sum += proc->cost();
//        }
//        return sum;
//    }
//    virtual bool is_equal(process *proc){
//        proc_series * proc_s = dynamic_cast<proc_series *>(proc);
//        if(!proc_s){
//            return false;
//        }
//        else{
//            for(size_t i : range(procs.size())){
//                if(!procs[i]->is_equal(proc_s->procs[i])){
//                    return false;
//                }
//            }
//            return true;
//        }
//    }
//    virtual string to_string(){
//        return "";
//    }
//};
