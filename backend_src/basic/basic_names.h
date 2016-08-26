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
    
    inline string buf_name(abstract::buf_ty bty){
        switch(bty){
        case abstract::STORED_READ:
        case abstract::STORED_WRITE:
            return STORED_ARR;
            
        case abstract::INPUT: return INPUT_ARR;
        case abstract::OUTPUT: return OUTPUT_ARR;
        }
    }
}
