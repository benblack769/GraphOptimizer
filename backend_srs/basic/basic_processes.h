#pragma once
#include <string>
#include  "process.h"
#include "oper.h"

using namespace std;

//a different class for each of the structurally different operation types

//custom process (allows user to write platform dependent code that calculates value)
class custom_proc:
    public process{

};

//true constant floats
class const_val:
    public process{
public:
    union{
        float f;
        int64_t i;
    }val;
    op::type ty;
    virtual string declaration(){
        return ""
    }
    virtual string usage(){
        return ty == op::INT ? to_string(val.i) : to_string(val.f);
    }
    virtual bool is_equal(process * proc){
        const_val * other = dynamic_cast<const_val *>(proc);
        if(!cptr){
            return false;
        }
        return this->ty ==
    }
    virtual size_t hash_val() = 0;
};
//basic operations
class bin_op:
    public process{
public:
    op::bin_core bin_op;
    virtual string declaration() = 0;
    virtual string usage() = 0;
    virtual bool is_equal(process * proc) = 0;
    virtual size_t hash_val() = 0;
};

//handles write delay semantics, intermed in-out non-functional logic etc.
class intermed:
    public process{
public:
    
    virtual string declaration() = 0;
    virtual string usage() = 0;
    virtual bool is_equal(process * proc) = 0;
    virtual size_t hash_val() = 0;
};
//handles reading from input array, etc
class info_input:
    public process{
public:
    mark_ty in_idx;
    final_output(mark_ty my_in_idx):
        in_idx(my_in_idx){}
    
    virtual string declaration() = 0;
    virtual string usage() = 0;
    virtual bool is_equal(process * proc) = 0;
    virtual size_t hash_val() = 0;
    
};

//handles writing to output array, etc
class final_output:
    public process{
public:
    mark_ty out_idx;
    final_output(mark_ty my_out_idx):
        out_idx(my_out_idx){}
    
    virtual string declaration(){
        return "";
    }

    virtual string usage(){
        return 
    }

    virtual bool is_equal(process * proc) = 0;
    virtual size_t hash_val() = 0;
};
