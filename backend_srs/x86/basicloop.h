#pragma once
#include "basicblock.h"
#include <vector>
class BasicLoop
{
public:
    uint64_t uniq_id;
    std::vector<BasicBlock> functors;
    BasicLoop(uint64_t in_uniq_id):
        uniq_id(in_uniq_id){}
    std::string to_string();
};
