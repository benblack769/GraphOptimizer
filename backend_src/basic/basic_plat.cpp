#include "basic_plat.h"
#include "graph_backend.h"
#include "utility.h"
#include "compcode.h"
#include "basic/basic_names.h"
#include "headerlib/RangeIterator.h"
#include <iostream>
#include <unordered_map>
using namespace std;

using kern_fn_t = void (*)(const float * in_data,float * out_data);
//void copy_data_into_buf(basic_plat * plat,float * in_data, mark_ty * buf_markers, size_t num_marks);
kern_fn_t get_kern_fn(CompCode &ccode, string kern_name);

struct basic_plat{
    std::string name;
    GraphBuilder ginfo;
    vector<basic_kernel> kernels;
    CompCode ccode;
    float * stored=nullptr;
    bool is_compiled = false;
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
        all_kerns += kern.to_string();
    }
    return all_kerns;
}
string get_header(basic_plat * plat){
    //initializes intermed array
    string header = "";
    header += "float "+names::STORED_ARR+"["+to_string(plat->ginfo.elements())+"] = {0};";
    header += "float * get_stored_buf(){return "+names::STORED_ARR+";}";
    return header;
}

void compile(basic_plat * plat){
    Assert(!plat->is_compiled,"platform can only be compiled once");
    plat->is_compiled = true;

    string full_string = get_header(plat) + get_all_kern_strs(plat);
    save_file("test.c",full_string);

    system("gcc -std=c99 -O0 -shared -o test.so -fPIC test.c");
    plat->ccode.init("./test.so");
    cout << "compiled" << endl;

    float *(*getstoredbuf)() = reinterpret_cast<float *(*)()>(plat->ccode.get_fn("get_stored_buf"));
    plat->stored = getstoredbuf();
    cout << "stored buf got" << endl;
}
void run(basic_plat * plat, uint64_t kern_id, const float *inputs, float * outputs, uint64_t num_iters){
    Assert(plat->is_compiled,"platform can only be run once compiled");
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
                   mark_ty * new_in_nodes, size_t new_in_size,
                   mark_ty * final_out_nodes, size_t final_out_size,
                   mark_ty * inter_in_nodes, size_t inter_in_size,
                   mark_ty * inter_out_nodes, size_t inter_out_size,
                   mark_ty * const_nodes, size_t const_size)
{
    uint64_t k_id = plat->kernels.size();
    plat->kernels.emplace_back(
                names::KERN+to_string(k_id)
                ,plat->ginfo
                ,marker_g(new_in_nodes,new_in_nodes+new_in_size)
                ,marker_g(final_out_nodes,final_out_nodes+final_out_size)
                ,marker_g(inter_in_nodes,inter_in_nodes+inter_in_size)
                ,marker_g(inter_out_nodes,inter_out_nodes+inter_out_size)
                ,marker_g(const_nodes,const_nodes+const_size)
                );

    return k_id;
}
void init_stored(basic_plat * plat){
    Assert(plat->is_compiled,"platform can only be initted once compiled");
    for(mark_ty mark : range(plat->ginfo.elements())){
        start::obj node = plat->ginfo.computes[mark];
        if(node.ty == start::STORED_READ){
            plat->stored[mark] = node.myunion.stor_read_d.initval;
        }
    }
    cout << "init finished\n\n" << endl;
}
void get_stored(basic_plat * plat,float * out_data, mark_ty * in_markers, size_t num_marks){
    Assert(plat->is_compiled,"platform data can only be accessed once compiled");
    for(size_t i = 0; i < num_marks; i++){
        out_data[i] = plat->stored[in_markers[i]];
    }
}
kern_fn_t get_kern_fn(CompCode & ccode,string kern_name){
    return reinterpret_cast<kern_fn_t>(ccode.get_fn(kern_name));
}
void check_marker(basic_plat * plat,mark_ty mark){
    ExitCondition(mark >= plat->ginfo.elements(),"invalid marker passed into c interface");
}
mark_ty add_bin(basic_plat * plat,mark_ty left,mark_ty right,int bin_op){
    check_marker(plat,left);
    check_marker(plat,right);
    Assert(bin_op >= 0 && bin_op < op::num_bin,"tried to add an invalid binary operation");
    plat->ginfo.computes.emplace_back(static_cast<op::bin_core>(bin_op),left,right);
    return plat->ginfo.last_added_item();
}
mark_ty add_uni(basic_plat * plat,mark_ty source,int uni_op){
    check_marker(plat,source);
    Assert(uni_op >= 0 && uni_op < op::num_uni,"tried to add an invalid unary operation");
    plat->ginfo.computes.emplace_back(static_cast<op::uni_core>(uni_op),source);
    return plat->ginfo.last_added_item();
}
mark_ty add_input(basic_plat * plat){
    mark_ty my_item = plat->ginfo.elements();
    plat->ginfo.computes.emplace_back(my_item);
    return my_item;
}
mark_ty add_init_val(basic_plat * plat, float initval){
    mark_ty my_item = plat->ginfo.elements();
    plat->ginfo.computes.emplace_back(my_item,initval);
    return my_item;
}
mark_ty add_const_f(basic_plat * plat,float value){
    plat->ginfo.computes.emplace_back(value);
    return plat->ginfo.last_added_item();
}