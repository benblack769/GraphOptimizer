#pragma once
#include "basic/basic_kernel.h"
#include "dis_op_process.h"

class disopt_kern:
        public basic_kernel
{
public:
    disopt_kern() = default;
    disopt_kern(std::string inname,
                 GraphBuilder & graph,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g inter_in_nodes,
                 marker_g inter_out_nodes,
                 marker_g const_nodes);

    virtual std::string generate_body();
protected:
    void parrelelize();
    sequencial::code_sequ code_loopization(comp_graph graph, size_t stored_arr_size);
};
