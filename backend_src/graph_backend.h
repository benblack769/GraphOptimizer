#pragma once
#include <vector>
#include "oper.h"
#include "graph_types.h"

namespace start{
enum class start_ty{CONST,BIN,UN,INPUT,STORED_READ};

struct bin{
    bin_core op;
};

struct un{
    uni_core op;
};

struct stored_read{
    float initval;
    mark_ty mark;
};

struct input{
    mark_ty mark;
};

struct fconst{
    float val;
};
union info_union{
    bin bin_d;
    un un_d;
    stored_read stor_read_d;
    input in_d;
    fconst const_d;
};
struct obj{
    start_ty ty;
    info_union myunion;
    marker_g inputs;
    obj(bin_core op,mark_ty left,mark_ty right):
        inputs({left,right}){
        ty = start_ty::BIN;
        myunion.bin_d = start::bin{op};
    }
    obj(uni_core op,mark_ty source):
        inputs({source}){
        ty = start_ty::UN;
        myunion.un_d = start::un{op};
    }
    obj(mark_ty nodemark):
        inputs(){
        ty = start_ty::INPUT;
        myunion.in_d = start::input{nodemark};
    }
    obj(mark_ty nodemark,float val):
        inputs(){
        ty = start_ty::STORED_READ;
        myunion.stor_read_d = start::stored_read{val,nodemark};
    }
    obj(float val):
        inputs(){
        ty = start_ty::CONST;
        myunion.const_d = start::fconst{val};
    }
};
}
class GraphBuilder{
public:
    std::vector<start::obj> computes;
    size_t elements(){
        return computes.size();
    }
    size_t last_added_item(){
        return computes.size() - 1;
    }
};
