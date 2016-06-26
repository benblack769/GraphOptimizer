#pragma once
#include <string>
#include <unordered_set>
#include <unordered_map>
#include "graph_backend.h"
#include "sub_graph.h"

class basic_kernel
{
public:
    std::string name;
    marker_g new_ins;
    marker_g fin_outs;

    marker_g inter_ins;
    marker_g inter_outs;

    marker_g sorted_all_nodes;
    basic_kernel(std::string inname,
                 GraphBuilder & graph,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g inter_in_nodes,
                 marker_g inter_out_nodes,
                 marker_g const_nodes);
    virtual std::string to_string(GraphBuilder & graph);
protected:
    void build_logic_graph(GraphBuilder & graph,marker_g & const_nodes);
};
