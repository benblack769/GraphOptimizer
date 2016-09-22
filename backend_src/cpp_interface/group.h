#pragma once
#include <cassert>
#include "graph_types.h"
#include "basic/basic_plat.h"
#include "oper.h"

class Node{
protected:
    basic_plat * platform;
    mark_ty nmark;
public:
    Node(basic_plat * inplat,mark_ty inmark):
        platform(inplat),
        nmark(inmark){}
    Node():Node(nullptr,mark_ty(-1)){}
    
#define BOP(oper,opname) \
    Node operator oper(const Node & other){ \
        return create_bin(other,opname);\
    }\
    Node & operator oper##= (const Node & other){\
        *this = *this oper other;\
        return *this;\
    }
    BOP(+,bin_core::ADD)
    BOP(-,bin_core::SUB)
    BOP(*,bin_core::MUL)
    BOP(/,bin_core::DIV)
#undef BOP
    Node operator -(){ 
        return create_un(uni_core::NEG);
    }
    Node exp(){
        return create_un(uni_core::EXP);
    }
    mark_ty get_mark(){
        return nmark;
    }
    friend Node concatenate(const std::vector<Node> & Nodes);
protected:
    Node create_bin(const Node & other,bin_core binop){
        assert(platform == other.platform);
        return Node(platform,add_bin(platform,nmark,other.nmark,static_cast<int>(binop)));
    }
    Node create_un(uni_core uniop){
        return Node(platform,add_uni(platform,nmark,static_cast<int>(uniop)));
    }
};
