#pragma once
#include <vector>
#include "graph_types.h"
class GraphBuilder{
public:
    //all of these vectors the same size
    std::vector<mark_ty> first;
    std::vector<mark_ty> second;
    std::vector<oper> node_op;
    Node get_node(mark_ty mark){
        return Node{first[mark],second[mark],node_op[mark]};
    }
    void add(oper nodeop,mark_ty nodefirst=nilmark,mark_ty nodesecond=nilmark){
        first.push_back(nodefirst);
        second.push_back(nodesecond);
        node_op.push_back(nodeop);
    }
    void add(Node n){
        add(n.node_op,n.first,n.second);
    }
    size_t elements(){
        return first.size();
    }
    size_t final_item(){
        return first.size() - 1;
    }
};
inline double to_double(mark_ty mark_info){
    return *reinterpret_cast<double *>(&mark_info);
}
inline int64_t to_int(mark_ty mark_info){
    return static_cast<int64_t>(mark_info);
}
inline mark_ty to_mark_ty(double data){
    return *reinterpret_cast<mark_ty *>(&data);
}
inline mark_ty to_mark_ty(int64_t data){
    return static_cast<mark_ty>(data);
}
