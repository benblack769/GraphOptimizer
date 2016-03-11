#pragma once
#include <fstream>
#include <vector>
#include <RangeIterator.h>

void save_file(std::string name,std::string text);
std::string read_file(std::ifstream & file);
void ExitError(std::string errstr);
inline void ExitCondition(bool condition,std::string errstr){
    if(condition){
        ExitError(errstr);
    }
}

template<typename vecty>
std::vector<vecty> combine(std::vector<vecty> v1,std::vector<vecty> v2){
    std::vector<vecty> res(v1.size() + v2.size());
    std::copy(v1.begin(),v1.end(),res.begin());
    std::copy(v2.begin(),v2.end(),res.begin()+v1.size());
    return res;
}
