
#include <headerlib/RangeIterator.h>
#include <algorithm>
#include "sub_graph.h"


void PositionedGraph::construct_adj_list(){
    adj_list.resize(size());
    for(mark_ty mark : range(size())){
        Node n = parent_list[mark];
        if(op::is_uni(n.node_op)){
            adj_list[n.first].push_back(mark);
        }
        else if(op::is_bin(n.node_op)){
            adj_list[n.first].push_back(mark);
            adj_list[n.second].push_back(mark);
        }
    }
}
void PositionedGraph::construct_depth_graph(){
    std::vector<bool> is_on_graph(size(),false);
    marker_g curnodes;
    //initial list of constants and inputs
    for(mark_ty m : range(size())){
        Node n = parent_list[m];
        if(!op::is_bin(n.node_op) && !op::is_uni(n.node_op)){
            curnodes.push_back(m);
            is_on_graph[m] = true;
        }
    }
    depth_list.assign(size(),0);
    uint64_t depth = 0;
    for(; curnodes.size(); depth++){
        marker_g nextnodes;
        for(mark_ty curm : curnodes){
            for(mark_ty nextm : adj_list[curm]){
                Node n = parent_list[nextm];
                if(op::is_uni(n.node_op) ||
                         (op::is_bin(n.node_op) &&
                          is_on_graph[n.first] &&
                          is_on_graph[n.second])){
                    depth_list[nextm] = depth;
                    is_on_graph[nextm] = true;
                    nextnodes.push_back(nextm);
                }
            }
        }
        curnodes.swap(nextnodes);
    }
    depth_graph.assign(depth,marker_g());
    for(mark_ty m : range(size())){
        depth_graph[depth_list[m]].push_back(m);
    }
}

void PositionedGraph::build_ordered_vec(marker_g & outvec,depth_maps_ty & cur_maps,size_t curdepth){
    outvec = depth_graph[curdepth];

    std::sort(outvec.begin(),outvec.end(),[&](mark_ty m1,mark_ty m2){
        Node n1 = parent_list[m1];
        Node n2 = parent_list[m2];
        if(n1.node_op != n2.node_op){
            return (n1.node_op < n2.node_op);//arbitrary ordering for uneuqal nodes
        }

        uint64_t d1 = depth_list[m1];
        uint64_t d2 = depth_list[m2];

        if(d1 != d2){
            return d1 < d2;
        }

        uint64_t idx1 = cur_maps[d1][m1];
        uint64_t idx2 = cur_maps[d2][m2];

        return idx1 < idx2;
    });
}
void PositionedGraph::build_map(depth_map_ty & out_map,marker_g & pos_vec){
    for(uint64_t m : range(pos_vec.size())){
        out_map[pos_vec[m]] = m;
    }
}
bool PositionedGraph::is_equal(PositionedGraph & other){
    using namespace std;

    if(num_inputs != other.num_inputs ||
            num_outputs != other.num_outputs ||
            size() != other.size() ||
            depth_graph.size() != other.depth_graph.size()){
        return false;
    }
    //map of marker to comparison unique index
    depth_maps_ty mydepth_maps(depth_graph.size());
    depth_maps_ty otherdepth_maps(depth_graph.size());
    for(mark_ty in_m : range(num_inputs)){
        mydepth_maps[0][in_m] = in_m;
        otherdepth_maps[0][in_m] = in_m;
    }
    auto pos_vecs_equal = [&](marker_g & vec1,marker_g & vec2){
        if(vec1.size() != vec2.size()){
            return false;
        }
        for(uint64_t idx : range(vec1.size())){
            mark_ty m1 = vec1[idx];
            mark_ty m2 = vec2[idx];
            if(parent_list[m1].node_op != other.parent_list[m2].node_op){
                return false;
            }
            uint64_t d1 = depth_list[m1];
            uint64_t d2 = other.depth_list[m2];
            if(d1 != d2){
                return false;
            }
            if(mydepth_maps[d1][m1] != otherdepth_maps[d2][m2]){
                return false;
            }
        }
        return true;
    };
    for(size_t depth : range(depth_graph.size())){
        marker_g my_ordered,other_ordered;
        this->build_ordered_vec(my_ordered,mydepth_maps,depth);
        other.build_ordered_vec(other_ordered,otherdepth_maps,depth);
        if(!pos_vecs_equal(my_ordered,other_ordered)){
            return false;
        }
        depth_map_ty & mymap = mydepth_maps[depth];
        depth_map_ty & othermap = otherdepth_maps[depth];
        for(uint64_t idx : range(my_ordered.size())){
            mymap[my_ordered[idx]] = idx;
            othermap[other_ordered[idx]] = idx;
        }
    }
    return true;
}
bool PositionedGraph::operator == (PositionedGraph & other){
    if(size() != other.size()){
        return false;
    }
    auto nodes_equal = [](Node n1, Node n2){
        return n1.first == n2.first && n1.second == n2.second && n1.node_op == n2.node_op;
    };
    for(mark_ty m : range(size())){
        if(!nodes_equal(parent_list[m],other.parent_list[m])){
            return false;
        }
    }
    return true;
}
