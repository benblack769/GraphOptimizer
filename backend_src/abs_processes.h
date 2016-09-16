#pragma once
#include <cstdint>
#include <cassert>
#include "oper.h"
using namespace std;

namespace abstract{
enum class proc_ty{BIN,UN,BUF_ACCESS};
enum class abs_buf_ty{INPUT,OUTPUT,STORED_READ,STORED_WRITE,CONST};
struct access{
    abs_buf_ty ty;
    size_t idx;
};
union info_union{
    bin_core bin_op;
    uni_core uni_op;
    access acc_data;
};
class process{
protected:
    proc_ty type;
    info_union myunion;
public:
    process(bin_core op){
        type = proc_ty::BIN;
        myunion.bin_op = op;
    }
    process(uni_core op){
        type = proc_ty::UN;
        myunion.uni_op = op;
    }
    process(size_t bufidx,abs_buf_ty bufty){
        type = proc_ty::BUF_ACCESS;
        myunion.acc_data = access{bufty,bufidx};
    }
    proc_ty get_type(){
        return type;
    }
    access buf_access(){
        assert(type == proc_ty::BUF_ACCESS);
        return myunion.acc_data;
    }
    bin_core bin_op(){
        assert(type == proc_ty::BIN);
        return myunion.bin_op;
    }
    uni_core uni_op(){
        assert(type == proc_ty::UN);
        return myunion.uni_op;
    }
};
};
using abs_process = abstract::process;
