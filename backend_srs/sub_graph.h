#pragma once
#include "graph_types.h"
#include <unordered_map>

class PositionedGraph{
public:
    /*
    A graph which the inputs and outputs have a strict position, but
    intermediate values are able to be reordered and moved around.
    However, nodes always have higher integer markers than their parents.

    Also, any redundant nodes (those with same parents, same  are eliminated

    First num_inputs nodes are inputs, last num_outputs nodes are outputs(have 0 connecting nodes)
    */
    //all vectors are of size size() unless noted otherwise
    mark_ty num_inputs;
    mark_ty num_outputs;
    std::vector<marker_g> adj_list;

    std::vector<Node> parent_list;

    //depth_sorted.size() != size();
    //each vector of nodes has to be computed before the next one is
    //within each vector, the nodes are sorted by node_cmp
    std::vector<marker_g> depth_graph;
    //map of depths of nodes
    std::vector<uint64_t> depth_list;

    PositionedGraph(){
        //construct_depth_graph();
    }
    mark_ty size(){
        return parent_list.size();
    }
    bool operator == (PositionedGraph & other);
    //is a perfect comparison, unlike operator ==, but is slower
    bool is_equal(PositionedGraph & other);
protected:
    //constructor helper functions
    //need to be executed in this order
    void construct_adj_list();
    void construct_depth_graph();

    //is_equal helper functions
    using depth_map_ty = std::unordered_map<mark_ty,uint64_t>;
    using depth_maps_ty = std::vector<depth_map_ty>;
    void build_ordered_vec(marker_g & outvec,depth_maps_ty & cur_maps,size_t curdepth);
    void build_map(depth_map_ty & out_map,marker_g & pos_vec);
};
