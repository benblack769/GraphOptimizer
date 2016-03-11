#include "basic_plat.h"
#include "graph_backend.h"
#include "utility.h"

using namespace std;
struct basic_plat{
    uint64_t unique_id_count=0;
    std::string name;
    GraphInfo ginfo;
    vector<basic_kernel> kernels;
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
mark_ty add_bin(basic_plat * plat,mark_ty left,mark_ty right,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!op::is_bin(n_oper),"add_bin called with a non-binary operation specified");
    plat->ginfo.add(n_oper,left,right);
}
mark_ty add_uni(basic_plat * plat,mark_ty source,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!op::is_uni(n_oper),"add_uni called with a non-unary operation specified");
    plat->ginfo.add(n_oper,source);
}
mark_ty add_input(basic_plat * plat,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!op::is_input(n_oper),"add_input called with a non-input operation specified");
    plat->ginfo.add(n_oper);
}
mark_ty add_initilized_i(basic_plat * plat,int64_t value,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!(op::is_int(n_oper) && op::is_const(n_oper)),"add_initilized_i called with a non-integer or non_const operation specified");
    plat->ginfo.add(n_oper,to_mark_ty(value));
}
mark_ty add_initilized_f(basic_plat * plat,double value,uint32_t n_op){
    oper n_oper = to_oper(n_op);
    ExitCondition(!(op::is_float(n_oper) && op::is_const(n_oper)),"add_initilized_f called with a non-float or non_const operation specified");
    plat->ginfo.add(n_oper,to_mark_ty(value));
}
void compile(basic_plat * plat){

}
void run(basic_plat * plat,uint64_t kern_id,double * inputs){

}
uint64_t make_kern(basic_plat * plat){

}
