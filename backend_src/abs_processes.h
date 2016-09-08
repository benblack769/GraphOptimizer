#pragma once
#include <cstdint>
#include <cassert>
#include "oper.h"
using namespace std;

namespace abstract{
enum proc_ty{BIN,UN,BUF_ACCESS};
enum buf_ty{INPUT,OUTPUT,STORED_READ,STORED_WRITE,CONST};
struct access{
    buf_ty ty;
    size_t idx;
};
union info_union{
    op::bin_core bin_op;
    op::uni_core uni_op;
    access acc_data;
};
class process{
protected:
    proc_ty type;
    info_union myunion;
public:
    process(op::bin_core op){
        type = BIN;
        myunion.bin_op = op;
    }
    process(op::uni_core op){
        type = UN;
        myunion.uni_op = op;
    }
    process(size_t bufidx,buf_ty bufty){
        type = BUF_ACCESS;
        myunion.acc_data = access{bufty,bufidx};
    }
    proc_ty get_type(){
        return type;
    }
    access buf_access(){
        assert(type == BUF_ACCESS);
        return myunion.acc_data;
    }
    op::bin_core bin_op(){
        assert(type == BIN);
        return myunion.bin_op;
    }
    op::uni_core uni_op(){
        assert(type == UN);
        return myunion.uni_op;
    }
};
};
using abs_process = abstract::process;
