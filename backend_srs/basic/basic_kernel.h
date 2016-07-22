#pragma once
#include <string>
#include <unordered_set>
#include <unordered_map>
#include "graph_backend.h"
#include "sub_graph.h"

struct compute_node{
    process * proc;
    vector<process *> inputs;
    vector<process *> outputs;
    void store(){
        
    }
    void get(){
        
    }
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
    basic_kernel(std::string inname,
                 GraphBuilder & graph,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g inter_in_nodes,
                 marker_g inter_out_nodes,
                 marker_g const_nodes);
    virtual std::string to_string(GraphBuilder & graph);
protected:
    void sort_needed_nodes(marker_g & out_sorted_nodes,GraphBuilder & graph,marker_g & const_nodes);
    void build_compnode_graph(marker_g & sorted_nodes,GraphBuilder & graph,default_process_generator & proc_gen);
};
