#pragma once
#include "basic_kernel.h"
#include "graph_types.h"

class basic_plat;
extern "C"{
basic_plat * new_plat(const char * name);
void delete_plat(basic_plat * plat);
mark_ty add_bin(basic_plat * plat, mark_ty left, mark_ty right, uint32_t n_op);
mark_ty add_uni(basic_plat * plat,mark_ty source,uint32_t n_op);
mark_ty add_input(basic_plat * plat,uint32_t n_op);
mark_ty add_initilized_i(basic_plat * plat,int64_t value,uint32_t n_op);
mark_ty add_initilized_f(basic_plat * plat,double value,uint32_t n_op);
void compile(basic_plat * plat);
void run(basic_plat * plat,uint64_t kern_id,double * inputs);
uint64_t make_kern(basic_plat * plat);
}
