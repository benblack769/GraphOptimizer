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

*/
class process{
protected:
    //ensures function name is unique
    //gets passed in from process generator
    uint64_t unique_id;
public:
    process(uint64_t in_unique_id){
        unique_id = in_unique_id;
    }
    //corresponds to the time it takes to execute
    //todo: make this more sophisticated with resource useage statistics
    virtual double cost() = 0;
    // generates a function that calculates the value from array inputs
    // function has language agnostic interface
    //
    // void calc(input_array,output_array)
    //
    virtual string declaration() = 0;
    virtual string usage() = 0;
    virtual bool is_equal(process * proc) = 0;
    virtual size_t hash_val() = 0;
};
forward_list<unique_ptr<process>> arg;
struct hash_key{
    process * proc;
    bool operator == (hash_key other) const{
        return proc->is_equal(other.proc);
    }
};
namespace std {
    template <>
    struct hash<hash_key>
    {
        std::size_t operator()(const hash_key& k) const{
            return k.proc->hash_val();
        }
    };
};

class scalar_proc:
    public process{
public:
    oper myop;
    scalar_proc(uint64_t in_unique_id,oper op):
        process(in_unique_id){
        myop = op;
    }
    virtual bool is_equal(process *proc){
        scalar_proc * sproc = dynamic_cast<scalar_proc *>(proc);
        return sproc && this->myop == sproc->myop;
    }
    virtual double cost(){
        return 1.0;
    }
    virtual string declaration(){
        /*if(op::is_bin(myop)){
            return fun_str(to_string(unique_id),
        }*/
    }
    virtual string usage(){

    }
};
class proc_series:
    public process{
public:
    vector<process *> procs;
    proc_series(uint64_t in_unique_id,oper op):
        process(in_unique_id){
    }
    virtual double cost(){
        double sum = 0;
        for(process * proc : procs){
            sum += proc->cost();
        }
        return sum;
    }
    virtual bool is_equal(process *proc){
        proc_series * proc_s = dynamic_cast<proc_series *>(proc);
        if(!proc_s){
            return false;
        }
        else{
            for(size_t i : range(procs.size())){
                if(!procs[i]->is_equal(proc_s->procs[i])){
                    return false;
                }
            }
            return true;
        }
    }
    virtual string to_string(){
        return "";
    }
};

class process_generator{
    unordered_set<hash_key> proc_set;
    bool proc_exists(process * proc){
        return proc_set.count(hash_key{proc});
    }
    process * identical_proc(process * proc){
        auto proc_it = proc_set.find(hash_key{proc});
        return (proc_it == proc_set.end()) ? nullptr : proc_it->proc;
    }
    void add_proc(process * proc){
        proc_set.insert(hash_key{proc});
    }
    virtual process * make_proc(){

    }
};

//current does not use any abstractions due to lack of need of them, this is just human API documentation
class compute_unit{
public:
    marker_g inputs;
    marker_g outputs;
    shared_ptr<process> proc;
};
void add_to_vec(std::vector<Node> & add_to,marker_g & marks,GraphBuilder & graph){
    for(mark_ty m : marks){
        add_to[m] = graph.get_node(m);
    }
}

disopt_kern::disopt_kern(std::string inname,
             GraphBuilder & graph,
             marker_g new_in_nodes,
             marker_g final_out_nodes,
             marker_g inter_in_nodes,
             marker_g inter_out_nodes,
             marker_g const_nodes):
    basic_kernel(inname,graph,new_in_nodes,final_out_nodes,inter_in_nodes,inter_out_nodes,const_nodes){
    std::vector<Node> my_graph_builder;

    add_to_vec(my_graph_builder,new_ins,graph);
    add_to_vec(my_graph_builder,inter_ins,graph);
    //for(mark_ty m : )
}

std::string disopt_kern::to_string(GraphBuilder & graph){
    for(mark_ty m : this->sorted_all_nodes){

    }

    return "";
}
