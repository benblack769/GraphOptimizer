#pragma once
#include <vector>
#include <cassert>
#include <string>
#include "basic/basic_names.h"
using namespace std;
namespace sequencial{
enum buf_ty{OUTPUT,STORED,INPUT,INTERNAL,CONSTANT,NOBUF};//todo: make all enums class enums for type safety
inline string buf_name(buf_ty buf){
    switch(buf){
    case CONSTANT:return names::CONST_BUF;
    case OUTPUT: return names::OUTPUT_ARR;
    case INPUT: return names::INPUT_ARR;
    case STORED: return names::STORED_ARR;
    case INTERNAL: return names::TEMP_KERN_BUF;
    case NOBUF:assert(false && "string requsted for nonexistant buffer");
    default: assert(false && "bad case value");
    }
}
struct IdxVal{
    ptrdiff_t mul_val;
    string index;
};
struct Memory{
protected:
    size_t offset;
    buf_ty type;
    vector<IdxVal> loopvals;
public:
    Memory():
        offset(0),
        type(NOBUF){}
    Memory(size_t inoffset,buf_ty in_type):
        offset(inoffset),
        type(in_type){
    }
    buf_ty get_type(){
        return type;
    }
    size_t get_0_offset(){
        return offset;
    }
    bool operator == (Memory other){
        return type == other.type && offset == other.offset;
    }
    ptrdiff_t cur_mul_val(){
        assert(loopvals.size() > 0);
        return loopvals.back().mul_val;
    }
    bool same_idxvals(const Memory & other,bool ignore_other_back){
        return loopvals.size() == other.loopvals.size() - ignore_other_back
        && all_of(size_t(0),loopvals.size(),[&](size_t i){
            return loopvals[i].index == other.loopvals[i].index
            && loopvals[i].mul_val == loopvals[i].mul_val;
        });
    }
    void add_index(ptrdiff_t mulval,string index){
        loopvals.push_back(IdxVal{mulval,index});
    }
    string to_string(){
        string res = buf_name(get_type());
        res += "[";
        for(IdxVal & val : loopvals){
            res += "(";
            res += std::to_string(val.mul_val);
            res += "*";
            res += val.index;
            res += ")";
            res += "+";
        }
        res += std::to_string(offset);
        res += "]";
        return res;
    }
};
}
