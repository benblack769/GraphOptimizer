#pragma once
#include <string>
#include  "process.h"
#include "utility.h"
#include "oper.h"
#include "c_codegen.h"
#include "basic/basic_names.h"

using namespace std;

//a different class for each of the structurally different operation types

//custom process (allows user to write platform dependent code that calculates value)
/*class custom_proc:
    public process{

};
*/

//true constant floats
class const_float_val:
    public process{
public:
    double val;
    
    const_float_val(double inval):
        val(inval){}
    virtual string declaration(uint64_t unique_id){
        return "";
    }
    virtual string compute(uint64_t unique_id,const vector<string> & args){
        return to_string(val);
    }
    virtual bool is_equal(process * proc){
        const_float_val * other = dynamic_cast<const_float_val *>(proc);
        return !other && this->val == other->val;
    }
    virtual size_t hash_val(){
        return *reinterpret_cast<uint64_t *>(&val);
    }
};
//basic operations
class bin_op_proc:
    public process{
public:
    bin_op_proc(op::bin_core in_bop):
        bin_op(in_bop){}
    op::bin_core bin_op;
    virtual string declaration(uint64_t unique_id){
        return "";
    }
    virtual string compute(uint64_t unique_id,const vector<string> & args){
        return bin_str(args[0],args[1],bin_op);
    }
    virtual bool is_equal(process * proc) {
        bin_op_proc * other = dynamic_cast<bin_op_proc *>(proc);
        return !other &&  this->bin_op == other->bin_op;        
    }

    virtual size_t hash_val(){
        return bin_op;
    }
};
class uni_op_proc:
    public process{
public:
    uni_op_proc(op::uni_core in_uop):
        uop(in_uop){}
    op::uni_core uop;
    virtual string declaration(uint64_t unique_id){
        return "";
    }
    virtual string compute(uint64_t unique_id,const vector<string> & args){
        return uni_str(args[0],uop);
    }
    virtual bool is_equal(process * proc) {
        uni_op_proc * other = dynamic_cast<uni_op_proc *>(proc);
        return !other &&  this->uop == other->uop;        
    }

    virtual size_t hash_val(){
        return uop;
    }
};
/*
//handles write delay semantics, intermed in-out non-functional logic etc.
class intermed:
    public process{
public:
    size_t buf_index;
    
    intermed(size_t my_buf_idx):
        buf_index(my_buf_idx){}
    
    virtual string declaration(uint64_t unique_id){
        return "";
    }

    virtual string usage(uint64_t unique_id,const vector<string> & args){
        return access_idx(names::INTER_ARR,buf_index);
    }

    virtual bool is_equal(process * proc){
        intermed * other = dynamic_cast<intermed *>(proc);
        return !other &&  this->buf_index == other->buf_index;
    }

    virtual size_t hash_val(){
        return buf_index;
    }
};*/
//handles reading from input array, etc
class info_input:
    public process{
public:
    mark_ty in_idx;
    string bufname;
    info_input(mark_ty my_in_idx,string inbufname):
        in_idx(my_in_idx),
        bufname(inbufname){}
    
    virtual string declaration(uint64_t unique_id){
        return "";
    }

    virtual string compute(uint64_t unique_id,const vector<string> & args){
        return access_idx(args[0],in_idx);
    }
    
    virtual bool is_equal(process * proc){
        info_input * other = dynamic_cast<info_input *>(proc);
        return !other && this->in_idx == other->in_idx;
    }

    virtual size_t hash_val(){
        return in_idx;
    }
};

//handles writing to output array, etc
class final_output:
    public process{
public:
    mark_ty out_idx;
    
    string bufname;
    final_output(mark_ty my_out_idx):
        out_idx(my_out_idx){}
    
    virtual string declaration(uint64_t unique_id){
        return "";
    }

    virtual string compute(uint64_t unique_id,const vector<string> & args){
        return access_idx(args[0],out_idx);
    }

    virtual bool is_equal(process * proc){
        final_output * other = dynamic_cast<final_output *>(proc);
        return !other && this->out_idx == other->out_idx;
    }

    virtual size_t hash_val(){
        return out_idx;
    }
};
