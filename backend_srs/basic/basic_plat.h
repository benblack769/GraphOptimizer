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
void init_consts(basic_plat * plat);
//inputs is an array of multiple sets of inputs back to back. The size is dependednt on the kernel info and the number of iters
void run(basic_plat * plat, uint64_t kern_id, float *inputs, float *outputs, uint64_t num_iters);
uint64_t make_kern(basic_plat * plat,
                   mark_ty * new_in_nodes,size_t new_in_size,
                   mark_ty * final_out_nodes,size_t final_out_size,
                   mark_ty * inter_in_nodes,size_t inter_in_size,
                   mark_ty * inter_out_nodes,size_t inter_out_size,
                   mark_ty * const_nodes,size_t const_size);
void place_data_into(basic_plat * plat, float *out_data, mark_ty * in_markers, size_t num_marks);
}
