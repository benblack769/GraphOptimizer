#include "platform.h"
#include "utility.h"
#include <headerlib/RangeIterator.h>
#include <random>
#include <ctime>
#include "utility.h"
using namespace std;

using val_arr = vector<float>;
Group add(Group a,Group b){
    assert(a.size() == b.size());
    Group g(a.size());
    for(size_t i : range(a.size())){
        g[i] = a[i] + b[i];
    }
    return g;
}
Node sum(Platform & plat,Group x){
    Node sum = plat.const_node(0);
    for(Node & n : x){
        sum += n;
    }
    return sum;
}

Group mul(Group a,Group b){
    assert(a.size() == b.size());
    Group g(a.size());
    for(size_t i : range(a.size())){
        g[i] = a[i] * b[i];
    }
    return g;
}
vector<float> get_i(size_t len,size_t iters){
    vector<float> res(len*iters);
    for(size_t it : range(iters)){
        for(size_t j : range(len)){
            res[it*len+j] = it+j;
        }
    }
    return res;
}

bool full_test(){
    Platform plat("cpptest");
    size_t len = 1000;
    size_t iters = 78;
    Group in1 = plat.inputs(len);
    Group consts = plat.consts(vector<float>(len,19));
    Group inter1 = plat.stored_vals(vector<float>(len,3));
    Group inter2 = plat.stored_vals(vector<float>(len,5));
    Group all_inter_ins = combine(inter1,inter2);
    
    Group val_med = add(inter1,inter2);
    Group inter1out = mul(consts,inter1);
    Group inter2out = add(in1,val_med);
    Group fin_out;
    fin_out.push_back(sum(plat,val_med));
    Group all_inter_outs = combine(inter1out,inter2out);
    
    
    Kernel kern = plat.make_kern(in1,fin_out,all_inter_ins,all_inter_outs,Group());
    Group newout = add(all_inter_ins,all_inter_outs);
    Kernel k2 = plat.make_kern(Group(),newout,Group(),Group(),combine(all_inter_ins,all_inter_outs));
    
    plat.compile();
    plat.init_stored();
    
    vector<float> outputs(iters);
    vector<float> ins = get_i(len,iters);
    plat.run(kern,ins,outputs,iters);
    
    
    return true;
}
vector<float> rand_vec(size_t size){
    vector<float> rvec(size);
    std::default_random_engine eng(clock());
    std::uniform_real_distribution<float> dist(0,1);
    for(float & f : rvec){
        f = dist(eng);
    }
    return rvec;
}

template<typename val_ty> 
vector<val_ty> mat_mul(vector<val_ty> & a,vector<val_ty> & b,val_ty zero,size_t len){
    vector<val_ty> res(a.size());
    for(size_t j : range(len)){
        for(size_t i : range(len)){
            val_ty sum = zero;
            for(size_t k : range(len)){
                sum += a[j*len+k] * b[k*len+i];
            }
            res[j*len+i] = sum;
        }
    }
    return res;
}
val_arr mat_pow(val_arr start,int pow,size_t len){
    val_arr res = start;
    for(size_t kpow = pow-1; kpow > 0;){
        if(kpow%2){
            res = mat_mul(res,start,float(0),len);
            kpow--;
        }
        else{
            res = mat_mul(res,res,float(0),len);
            kpow /= 2;
        }
    }
    return res;
}
bool matmul_test(){
    Platform plat("matpowtest");
    const size_t len = 13;
    const size_t matpow = 7;
    vector<float> matstart = rand_vec(sqr(len));
    
    Node zero = plat.const_node(0);
    Group val_start = plat.consts(matstart);
    Group intermed = plat.stored_vals(matstart);
    
    Group sqr_val = mat_mul(intermed,intermed,zero,len);
    Group mul1_val = mat_mul(val_start,intermed,zero,len);
    
    Kernel sqr_kern = plat.make_kern(Group(),Group(),intermed,sqr_val,Group());
    Kernel mul1_kern = plat.make_kern(Group(),Group(),intermed,mul1_val,Group());
    plat.compile();
    plat.init_stored();
    
    val_arr nullouts;
    for(size_t kpow = matpow-1; kpow > 0;){
        if(kpow%2){
            plat.run(mul1_kern,val_arr(),nullouts,1);
            kpow--;
        }
        else{
            plat.run(sqr_kern,val_arr(),nullouts,1);
            kpow /= 2;
        }
    }
    val_arr kern_vals = plat.get_stored(intermed);
    val_arr cpp_vals = mat_pow(matstart,matpow,len);
    
    return equal(kern_vals.begin(),kern_vals.end(),cpp_vals.begin(),[](float a,float b){
        return abs(a-b) < (a+b)*0.0001;
    });
}
