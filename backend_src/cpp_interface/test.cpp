#include "platform.h"
#include "utility.h"
#include <headerlib/RangeIterator.h>
using namespace std;

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
