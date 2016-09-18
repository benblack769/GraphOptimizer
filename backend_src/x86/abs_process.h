#pragma once
#include <vector>
#include <memory>
#include "mem_impl.h"
using namespace std;

namespace sequencial{
class Process{
public:
    virtual ~Process() = default;
    //virtual Process & operator = (const Process & proc)=0;
    virtual bool stats_same(const Process & other)const=0;
    virtual vector<Memory *> mems()=0; //do not free pointers returned from this function
    virtual string to_string()=0;
    virtual unique_ptr<Process> clone() = 0;
};
using code_item = unique_ptr<Process>;
using code_sequ = vector<code_item>;
}
