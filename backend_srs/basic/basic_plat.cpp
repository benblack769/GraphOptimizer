#include "basic_plat.h"
#include "graph_backend.h"
#include "utility.h"
#include "compcode.h"
#include <iostream>
using namespace std;

using kern_fn_t = void (*)(float * in_data,float * out_data);
//void copy_data_into_buf(basic_plat * plat,float * in_data, mark_ty * buf_markers, size_t num_marks);
kern_fn_t get_kern_fn(CompCode &ccode, string kern_name);

struct basic_plat{
    std::string name;
    GraphBuilder ginfo;
    vector<basic_kernel> kernels;
    CompCode ccode;
};
basic_plat * new_plat(const char *name){
    basic_plat * ret = new basic_plat;
    ret->name = string(name);
    return ret;
}
void delete_plat(basic_plat * plat){
    delete plat;
}
string get_all_kern_strs(basic_plat * plat){
    string all_kerns;
    for(basic_kernel & kern : plat->kernels){
        all_kerns += kern.to_string(plat->ginfo);
    }
    return all_kerns;
}
void compile(basic_plat * plat){
    string full_string = get_all_kern_strs(plat);
    save_file("test.c",full_string);

    system("clang -std=c99 -O0 -shared -o test.so -fPIC test.c");
    plat->ccode.init("./test.so");
    cout << "compiled" << endl;

    float *(*getbuf)() = reinterpret_cast<float *(*)()>(plat->ccode.get_fn("get_buf"));
    plat->buf = getbuf();
}
void run(basic_plat * plat,uint64_t kern_id,float * inputs,float * outputs,uint64_t num_iters){
    basic_kernel & kern = plat->kernels[kern_id];
    kern_fn_t kern_fn = get_kern_fn(plat->ccode,kern.name);

    size_t num_ins = kern.new_ins.size();
    size_t num_outs = kern.fin_outs.size();
    for(uint64_t i = 0; i < num_iters; i++){
        kern_fn(inputs+i*num_ins,outputs+i*num_outs);
    }
    cout << "run finished" << endl;
}
uint64_t make_kern(basic_plat * plat,
                   mark_ty * new_in_nodes,size_t new_in_size,
                   mark_ty * final_out_nodes,size_t final_out_size,
                   mark_ty * inter_in_nodes,size_t inter_in_size,
                   mark_ty * inter_out_nodes,size_t inter_out_size,
                   mark_ty * const_nodes,size_t const_size)
{
    uint64_t k_id = plat->kernels.size();
    plat->kernels.emplace_back(
                "kern"+to_string(k_id)
                ,plat->ginfo
                ,marker_g(new_in_nodes,new_in_nodes+new_in_size)
                ,marker_g(final_out_nodes,final_out_nodes+final_out_size)
                ,marker_g(inter_in_nodes,inter_in_nodes+inter_in_size)
                ,marker_g(inter_out_nodes,inter_out_nodes+inter_out_size)
                ,marker_g(const_nodes,const_nodes+const_size)
                );

    return k_id;
}
void init_consts(basic_plat * plat){
    for(size_t i = 0; i < plat->ginfo.elements(); i++){
        oper curop = plat->ginfo.node_op[i];
        if(op::is_const(curop)){
            if(op::is_float(curop)){
                plat->buf[i] = to_double(plat->ginfo.first[i]);
            }
            else{
                ExitError("int init_consts not implemented");
            }
        }
    }
    cout << "init  finished\n\n\n" << endl;
}
void place_data_into(basic_plat * plat,float * out_data, mark_ty * in_markers, size_t num_marks){
    for(size_t i = 0; i < num_marks; i++){
        out_data[i] = plat->buf[in_markers[i]];
    }
}
/*
void copy_data_into_buf(basic_plat * plat,float * in_data, mark_ty * buf_markers, size_t num_marks){
    for(size_t i = 0; i < num_marks; i++){
        plat->buf[buf_markers[i]] = in_data[i];
    }
}*/
kern_fn_t get_kern_fn(CompCode & ccode,string kern_name){
    return reinterpret_cast<kern_fn_t>(ccode.get_fn(kern_name));
}
void check_marker(basic_plat * plat,mark_ty mark){
    ExitCondition(mark >= plat->ginfo.elements(),"invalid marker passed into c interface");
}
mark_ty add_bin(basic_plat * plat,mark_ty left,mark_ty right,int bin_op){
    check_marker(plat,left);
    check_marker(plat,right);
    plat->ginfo.add(bin_op,left,right);
    return plat->ginfo.final_item();
}
mark_ty add_uni(basic_plat * plat,mark_ty source,int uni_op){
    check_marker(plat,source);
    plat->ginfo.add(uni_op,source);
    return plat->ginfo.final_item();
}
mark_ty add_input(basic_plat * plat){
    plat->ginfo.add();
    return plat->ginfo.final_item();
}
mark_ty add_initilized_f(basic_plat * plat,double value){
    plat->ginfo.add(n_oper,value);
    return plat->ginfo.final_item();
}
