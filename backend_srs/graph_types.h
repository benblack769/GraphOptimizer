#pragma once
#include <cstdint>
#include "oper.h"
using mark_ty = uint64_t;
using index_ty = uint64_t;
static constexpr mark_ty nilmark = ~0ULL;
struct Node{
    mark_ty first;
    mark_ty second;
    mark_ty my_loc;
    oper node_op;
    Node(mark_ty infirst,mark_ty insec,oper inop,mark_ty in_my_loc=nilmark):
        first(infirst),
        second(insec),
        my_loc(in_my_loc),
        node_op(inop){}
};
