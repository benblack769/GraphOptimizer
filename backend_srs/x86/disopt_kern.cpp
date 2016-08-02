#include <memory>
#include <forward_list>
#include <unordered_set>
#include "headerlib/RangeIterator.h"
#include "disopt_kern.h"
#include "test.h"
#include "c_codegen.h"

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

Algorithm for finding approxamatly optimal vector paths.


*/


disopt_kern::disopt_kern(std::string inname,
             GraphBuilder & graph,
             default_process_generator & proc_gen,
             marker_g new_in_nodes,
             marker_g final_out_nodes,
             marker_g inter_in_nodes,
             marker_g inter_out_nodes,
             marker_g const_nodes):
    basic_kernel(inname,graph,proc_gen,new_in_nodes,final_out_nodes,inter_in_nodes,inter_out_nodes,const_nodes){
    parrelelize(proc_gen);
}
void cmp_depend_setter(vector<uint8_t> & cmp_depend,compute_node & cmp,vector<compute_node> & all_nodes,vector<abst_memory> & mem){
    if(!cmp_depend[cmp.nodeidx]){
        cmp_depend[cmp.nodeidx] = true;
        
        for(size_t memin : cmp.meminputs){
            cmp_depend_setter(cmp_depend,all_nodes[mem[memin].compnodeidx],all_nodes,mem);
        }
    }
}
vector<uint8_t> get_cmp_depend(compute_node & cmpnode,vector<compute_node> & all_nodes,vector<abst_memory> & mem){
    vector<uint8_t> cmp_depend(all_nodes.size(),false);
    cmp_depend_setter(cmp_depend,cmpnode,all_nodes,mem);
    return cmp_depend;
}
void set_count_ind(vector<uint8_t> & cmp_depend,vector<uint8_t> & is_counted,vector<uint64_t> & ind_count,compute_node & root,vector<compute_node> & all,vector<abst_memory> & mem){
    if(!is_counted[root.nodeidx] && !cmp_depend[root.nodeidx]){
        uint64_t rootindcount = 1;//the current node is not dependendent, so it is 1
        for(size_t memid : root.meminputs){
            size_t nextidx = mem[memid].compnodeidx;
            set_count_ind(cmp_depend,is_counted,ind_count,all[nextidx],all,mem);
            rootindcount += ind_count[nextidx];
        }
        ind_count[root.nodeidx] = rootindcount;
    }
}

vector<uint64_t> build_tree_count(compute_node & cmpend,vector<compute_node> & ends,vector<compute_node> & all,vector<abst_memory> & mem){
    vector<uint8_t> cmp_depend = get_cmp_depend(cmpend,all,mem);
    
    vector<uint64_t> ind_count(all.size(),0);
    vector<uint8_t> is_counted(all.size(),false);
    
    for(compute_node & endnode : ends){
        set_count_ind(cmp_depend,is_counted,ind_count,endnode,all,mem);
    }
    return ind_count;
}

void num_independent_of(compute_node & ind,compute_node & of,vector<compute_node> & allnodes){
//    depend = 0
//    for p in parent_tree(ind):
//        depend += int(p not in parent_tree(of))
    
}
void shared_reads(compute_node & out1,compute_node & out2,vector<compute_node> & allnodes){
    /*
        borders = 0
        for p in (full_tree(out1) union full_tree(out2)):
            borders += int(p is on the border of the tree of one of the outputs and the intersection of the two trees)
        return borders
    */
    
}

void disopt_kern::parrelelize(default_process_generator & proc_gen){
    vector<compute_node> outputs(nodes.rbegin(),nodes.rbegin()+inter_outs.size()+fin_outs.size());
    vector<compute_node> shared;
    
}

std::string disopt_kern::to_string(){
    return "";
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
