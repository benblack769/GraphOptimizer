#pragma once
#include <string>
#include "graph_backend.h"

using marker_g = std::vector<mark_ty>;

class basic_kernel
{
public:
    std::string mystr;
    basic_kernel(GraphInfo & graph,
                 marker_g new_in_nodes,
                 marker_g final_out_nodes,
                 marker_g inter_in_nodes,
                 marker_g inter_out_nodes,
                 marker_g const_nodes);
    std::string to_string();
protected:    
};
