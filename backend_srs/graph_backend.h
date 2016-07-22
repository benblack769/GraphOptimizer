#pragma once
#include "process.h"
#include "process_maker.h"

namespace start{
enum type{CONST,BIN,UN,INPUT,STORED};

struct bin{
    op::bin_core op;
};

struct un{
    op::uni_core op;
};

struct stored{
    double initval;
    mark_ty mark;
};

struct input{
    mark_ty mark;
};

struct fconst{
    double val;
};
union info_union{
    bin bin_d;
    un un_d;
    stored stor_d;
    input in_d;
    fconst const_d;
};
struct obj{
    type ty;
    info_union myunion;
    marker_g inputs;
    obj(op::bin_core op,mark_ty left,mark_ty right):
        inputs({left,right}){
        ty = BIN;
        myunion.bin_d = start::bin{op};
    }
    obj(op::uni_core op,mark_ty source):
        inputs({source}){
        ty = UN;
        myunion.un_d = start::un{op};
    }
    obj(mark_ty nodemark):
        inputs(){
        ty = INPUT;
        myunion.in_d = start::input{nodemark};
    }
    obj(mark_ty nodemark,double val):
        inputs(){
        ty = STORED;
        myunion.stor_d = start::stored{val,nodemark};
    }
    obj(double val):
        inputs(){
        ty = CONST;
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
