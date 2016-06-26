#pragma once
#include <cstdint>
#include <vector>
#include "oper.h"
using mark_ty = uint64_t;
using index_ty = uint64_t;
using marker_g = std::vector<mark_ty>;
static constexpr mark_ty nilmark = ~0ULL;

struct Node{
    mark_ty first;
    mark_ty second;
    oper node_op;
    Node(mark_ty infirst,mark_ty insec,oper inop):
        first(infirst),
        second(insec),
        node_op(inop){}
};
