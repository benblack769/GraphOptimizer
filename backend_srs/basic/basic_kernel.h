#pragma once
#include <string>
#include <unordered_set>
#include <unordered_map>
#include "graph_backend.h"
#include "sub_graph.h"

struct compute_node;
struct abst_memory{
    // abstract memory feature
    // memid is an abstract id that happens to correpond
    // with the location of the memory in the kernel memvector
    size_t memid;
    vector<size_t> compdestids;
};

struct compute_node{
    vector<size_t> meminputs;
    process * proc;
    size_t memoutput;
    bool has_output;
};

class basic_kernel
{
public:
    std::string name;
    marker_g new_ins;
    marker_g fin_outs;

    marker_g inter_ins;
    marker_g inter_outs;

    vector<compute_node> nodes;
    vector<abst_memory> memory;
    basic_kernel(std::string inname,
                 GraphBuilder & graph,
                 default_process_generator & proc_gen,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g const_nodes);
    virtual std::string to_string();
protected:
    void sort_needed_nodes(marker_g & out_sorted_nodes,GraphBuilder & graph,marker_g & const_nodes);
    void build_compnode_graph(marker_g & sorted_nodes,GraphBuilder & graph,default_process_generator & proc_gen);
};
