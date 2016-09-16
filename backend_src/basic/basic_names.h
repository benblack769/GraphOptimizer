#pragma once
#include <string>
#include "abs_processes.h"

using namespace std;
namespace names{
    const string KERN = "kern";
    const string STORED_ARR = "storedbuf";
    const string INPUT_ARR = "in_ptr";
    const string OUTPUT_ARR = "out_ptr";
    const string TEMP_KERN_BUF = "tbuf";
    const string CONST_BUF = "cbuf";
    
    inline string buf_name(abstract::abs_buf_ty bty){
        using namespace abstract;
        switch(bty){
        case abs_buf_ty::STORED_READ:
        case abs_buf_ty::STORED_WRITE:return STORED_ARR;
        case abs_buf_ty::INPUT: return INPUT_ARR;
        case abs_buf_ty::OUTPUT: return OUTPUT_ARR;
        case abs_buf_ty::CONST: return CONST_BUF;
        default: assert(false && "bad case value");
        }
    }
}
