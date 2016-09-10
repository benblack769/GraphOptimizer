#pragma once
#include <string>
#include <unordered_set>
#include <unordered_map>
#include "graph_backend.h"
#include "sub_graph.h"
#include "abs_processes.h"

using namespace std;

struct compute_node;
struct abst_memory{
    // abstract memory feature
    // memid is an abstract id that happens to correpond
    // with the location of the memory in the kernel memvector
    size_t compnodeidx;
    vector<size_t> compdestids;
};

struct compute_node{//todo: put this and abst_memory in abstract namespace in abs_processes.h
    vector<size_t> meminputs;
    abs_process proc;
    vector<size_t> memoutputs;
    size_t nodeidx;
};

struct comp_graph{
    vector<compute_node> nodes;
    vector<abst_memory> mem;
    /*void insert(compute_node & node,comp_graph & nodegraph){
        
    }
    void remove(compute_node){
        
    }*/
};

class basic_kernel
{
public:
    std::string name;
    marker_g new_ins;
    marker_g fin_outs;

    marker_g inter_ins;
    marker_g inter_outs;
    
    marker_g constnodes;

    comp_graph graph;
    size_t max_stored_idx;
    basic_kernel(std::string inname,
                 GraphBuilder & graph,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g inter_inputs,
                 marker_g inter_outputs,
                 marker_g const_nodes);
    virtual ~basic_kernel() = default;
    
    virtual std::string to_string();
    virtual std::string generate_body();
protected:
    void sort_needed_nodes(marker_g & out_sorted_nodes,GraphBuilder & graph,marker_g & const_nodes);
    void build_compnode_graph(marker_g & sorted_nodes,GraphBuilder & graph);
    void initiate_memory(size_t memsize);
};
