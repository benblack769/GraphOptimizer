#pragma once
#include "basic/basic_kernel.h"


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
                 marker_g const_nodes):
        basic_kernel(inname,graph,new_in_nodes,final_out_nodes,inter_in_nodes,inter_out_nodes,const_nodes){}

    virtual std::string to_string(GraphBuilder & graph);
};
