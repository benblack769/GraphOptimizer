#pragma once
#include "process.h"

class compute_unit{
public:
    process * proc;//non-owning
    marker_g inputs;
};

class GraphBuilder{
public:
    std::vector<compute_unit> computes;
    size_t elements(){
        return computes.size();
    }
    size_t final_item(){
        return computes.size() - 1;
    }
};
