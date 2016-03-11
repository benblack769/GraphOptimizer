#pragma once
#include "graph_types.h"
#include <string>

class BasicBlock
{
public:
    uint64_t unique_id;
    uint64_t size;

    oper myop;

    BasicBlock();
    std::string to_string();
};
