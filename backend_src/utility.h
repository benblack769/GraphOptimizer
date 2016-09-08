#pragma once
#include <vector>
#include <string>

void save_file(std::string name,std::string text);
std::string read_file(std::ifstream & file);
void ExitError(std::string errstr);
inline void ExitCondition(bool condition,std::string errstr){
    if(condition){
        ExitError(errstr);
    }
}
inline void Assert(bool condition,std::string errstr){
    ExitCondition(!condition,errstr);
}
template<typename vecty>
std::vector<vecty> combine(std::vector<vecty> v1,std::vector<vecty> v2){
    std::vector<vecty> res(v1.size() + v2.size());
    std::copy(v1.begin(),v1.end(),res.begin());
    std::copy(v2.begin(),v2.end(),res.begin()+v1.size());
    return res;
}
inline void prints(std::string s){
    printf(s.c_str());
    fflush(stdout);
}
template<typename fn_ty>
inline bool all_of(size_t start,size_t end,fn_ty fn){
    for(size_t i = start; i < end; i++){
        if(!fn(i))
            return false;
    }
    return true;
}
