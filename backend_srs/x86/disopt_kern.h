#pragma once
#include "basic/basic_kernel.h"

class disopt_kern:
        public basic_kernel
{
public:
    disopt_kern() = default;
    disopt_kern(std::string inname,
                 GraphBuilder & graph,
                 default_process_generator & proc_gen,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g inter_in_nodes,
                 marker_g inter_out_nodes,
                 marker_g const_nodes);

    virtual std::string to_string();
protected:
    void parrelelize(default_process_generator & proc_gen);
    void loop_code(default_process_generator & proc_gen);
};
