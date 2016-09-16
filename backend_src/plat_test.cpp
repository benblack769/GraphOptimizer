#include <iostream>
#include "utility.h"
#include "test.h"
#include "basic/basic_plat.h"
#include "oper.h"

using namespace std;



bool plat_test(){
    const float initval = 5.4;
    const float constval = 12.9;
    constexpr size_t num_iters = 4;
    const float inputs[num_iters] = {12.2,1.2,0.4,92.3};
    
    
    basic_plat * plat = new_plat("testplat");
    mark_ty in = add_input(plat);
    mark_ty inter = add_init_val(plat,initval);
    mark_ty fconst = add_const_f(plat,constval);
    mark_ty in_inter_sum = add_bin(plat,in,inter,static_cast<int>(bin_core::ADD));
    mark_ty in_const_mul = add_bin(plat,in,fconst,static_cast<int>(bin_core::MUL));
    
    uint64_t kern = make_kern(plat,
                              &in,1,
                              &in_inter_sum,1,
                              &inter,1,
                              &in_const_mul,1,
                              nullptr,0);
    compile(plat);
    init_stored(plat);
    float outputs[num_iters];
    run(plat,kern,inputs,outputs,num_iters);
    float inter_fin;
    get_stored(plat,&inter_fin,&inter,1);
    
    
    //now calculating the real values
    float realouts[num_iters];
    float iter_val = initval;
    for(size_t i = 0; i < num_iters; i++){
        realouts[i] = inputs[i] + iter_val;
        iter_val = inputs[i] * constval;
    }
    
    return equal(outputs,outputs+num_iters,realouts) && iter_val == inter_fin;
}

