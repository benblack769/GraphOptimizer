#include "basic_plat.h"
#include "graph_backend.h"
#include "utility.h"
#include "compcode.h"

using namespace std;

using kern_fn_t = void (*)();
void copy_data_into_buf(basic_plat * plat,float * in_data, mark_ty * buf_markers, size_t num_marks);
kern_fn_t get_kern_fn(CompCode &ccode, string kern_name);

struct basic_plat{
    uint64_t unique_id_count=0;//for sub-kernel internal functions
    std::string name;
    GraphInfo ginfo;
    vector<basic_kernel> kernels;
    CompCode ccode;
    float * buf=NULL;
};
oper to_oper(op::op_int_ty o){
    return static_cast<oper>(o);
}
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
        all_kerns += kern.to_string();
    }
    return all_kerns;
}
string get_header(basic_plat * plat){
    return "float buf["+to_string(plat->ginfo.elements())+"];float * get_buf(){return buf;}";
}
void compile(basic_plat * plat){
    string full_string = get_header(plat) + get_all_kern_strs(plat);
    save_file("test.c",full_string);

    system("gcc -std=c99 -O3 -shared -o test.so -fPIC test.c");

    plat->ccode = CompCode("./test.so");

    float *(*getbuf)() = reinterpret_cast<float *(*)()>(plat->ccode.get_fn("get_buf"));
    plat->buf = getbuf();
}
void run(basic_plat * plat,uint64_t kern_id,float * inputs,float * outputs,uint64_t num_iters){
    basic_kernel & kern = plat->kernels[kern_id];
    void(*kern_fn)() = get_kern_fn(plat->ccode,kern.name);

    size_t num_ins = kern.new_ins.size();
    size_t num_outs = kern.new_ins.size();
    for(uint64_t i = 0; i < num_iters; i++){
        copy_data_into_buf(plat,inputs+i*num_ins,kern.new_ins.data(),num_ins);
        kern_fn();
        place_data_into(plat,outputs+i*num_outs,kern.fin_outs.data(),num_outs);
    }
}
uint64_t make_kern(basic_plat * plat,
                   mark_ty * new_in_nodes,size_t new_in_size,
                   mark_ty * final_out_nodes,size_t final_out_size,
                   mark_ty * inter_in_nodes,size_t inter_in_size,
                   mark_ty * inter_out_nodes,size_t inter_out_size,
                   mark_ty * const_nodes,size_t const_size)
{
    uint64_t k_id = plat->unique_id_count;
    plat->unique_id_count++;

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

void place_data_into(basic_plat * plat,float * out_data, mark_ty * in_markers, size_t num_marks){
    for(size_t i = 0; i < num_marks; i++){
        out_data[i] = plat->buf[in_markers[i]];
    }
}
void copy_data_into_buf(basic_plat * plat,float * in_data, mark_ty * buf_markers, size_t num_marks){
    for(size_t i = 0; i < num_marks; i++){
        plat->buf[buf_markers[i]] = in_data[i];
    }
}
kern_fn_t get_kern_fn(CompCode & ccode,string kern_name){
    return reinterpret_cast<kern_fn_t>(ccode.get_fn(kern_name));
}

mark_ty add_bin(basic_plat * plat,mark_ty left,mark_ty right,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!op::is_bin(n_oper),"add_bin called with a non-binary operation specified");
    plat->ginfo.add(n_oper,left,right);
    return plat->ginfo.elements();
}
mark_ty add_uni(basic_plat * plat,mark_ty source,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!op::is_uni(n_oper),"add_uni called with a non-unary operation specified");
    plat->ginfo.add(n_oper,source);
    return plat->ginfo.elements();
}
mark_ty add_input(basic_plat * plat,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!op::is_input(n_oper),"add_input called with a non-input operation specified");
    plat->ginfo.add(n_oper);
    return plat->ginfo.elements();
}
mark_ty add_initilized_i(basic_plat * plat,int64_t value,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!(op::is_int(n_oper) && op::is_const(n_oper)),"add_initilized_i called with a non-integer or non_const operation specified");
    plat->ginfo.add(n_oper,to_mark_ty(value));
    return plat->ginfo.elements();
}
mark_ty add_initilized_f(basic_plat * plat,double value,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!(op::is_float(n_oper) && op::is_const(n_oper)),"add_initilized_f called with a non-float or non_const operation specified");
    plat->ginfo.add(n_oper,to_mark_ty(value));
    return plat->ginfo.elements();
}
