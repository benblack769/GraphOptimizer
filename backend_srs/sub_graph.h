#pragma
#include "graph_types.h"
#include <headerlib/RangeIterator.h>
#include <algorithm>

struct UniqueNodeComp{
    /*gaurenteed to different ordering for differnt graph
     * and produce same ordering for same graph unless
     * two nodes are perfectly equal (redundant)*/
    bool operator() (const Node& x, const Node& y) const {
        return
           (x.first != y.first) ? x.first < y.first :
           (x.second != y.second) ? x.second < y.second :
           (x.node_op != y.node_op) ? x.node_op < y.node_op : false;
    }
};
class PositionedGraph{
public:
    /*
    A graph which the inputs and outputs have a strict position, but
    intermediate values are able to be reordered and moved around.
    However, nodes always have higher integer markers than their parents.

    Also, any redundant nodes (those with same parents, same  are eliminated

    First num_inputs nodes are inputs, last num_outputs nodes are outputs(have 0 connecting nodes)
    */
    mark_ty num_inputs;
    mark_ty num_outputs;
    std::vector<marker_g> adj_list;

    std::vector<Node> parent_list;

    //depth_sorted.size() != size();
    //each vector of nodes has to be computed before the next one is
    //within each vector, the nodes are sorted by node_cmp
    std::vector<marker_g> sorted_depth_graph;

    PositionedGraph(){
        construct_depth_graph();
        sort_depth_graph();
    }

    void sort_depth_graph(){
        for(marker_g & vec : sorted_depth_graph){
            std::sort(vec.begin(),vec.end(),UniqueNodeComp());
        }
    }
    void construct_depth_graph(){
        for(Node n : adj_list){

        }
    }
    mark_ty size(){
        return adj_list.size();
    }
    bool is_equal(PositionedGraph & other){
        if(num_inputs != other.num_inputs ||
                num_outputs != other.num_outputs ||
                size() != other.size() ||
                sorted_depth_graph.size() != other.sorted_depth_graph.size()){
            return false;
        }
        for(size_t depth : range(sorted_depth_graph.size())){
            marker_g & my_depth = sorted_depth_graph[depth];
            marker_g & other_depth = other.sorted_depth_graph[depth];
            if(my_depth.size() != other_depth.size()){
                return false;
            }
            for(size_t i : range(my_depth.size())){
                if(my_depth[i] != other_depth[i]){
                    return false;
                }
            }
        }
        return true;
    }
}
