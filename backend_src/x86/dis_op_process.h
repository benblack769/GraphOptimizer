#pragma once
#include <vector>
#include <cstdint>
#include <cassert>
#include <string>
#include <algorithm>
#include <iostream>
#include "oper.h"
#include "c_codegen.h"
#include "basic/basic_names.h"
#include "utility.h"
#include <headerlib/construct_help.hpp>

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
    //bool operator == (Memory other){
    //    return type == other.type && offset == other.offset;
    //}
    ptrdiff_t cur_mul_val(){
        return loopvals.back().mul_val;
    }
    void add_index(ptrdiff_t mulval,string index){
        loopvals.push_back(IdxVal{mulval,index});
    }
    string acc_string(){
        string res = buf_name(get_type());
        res += "[";
        for(IdxVal & val : loopvals){
            res += "(";
            res += to_string(val.mul_val);
            res += "*";
            res += val.index;
            res += ")";
            res += "+";
        }
        res += to_string(offset);
        res += "]";
        return res;
    }
};
enum scalar_ty{UNI,BIN};

enum proc_ty{NOPROC,SCALAR,LOOP};

struct Scalar;
struct Loop;
class Process{
protected:
    proc_ty type;
    void * data;
public:
    Process():
        type(NOPROC),
        data(nullptr){};
    Process(const Scalar & sca);
    Process(const Loop & loop);
    Process(const Process & proc){
        *this = proc;
    }
    Process & operator = (const Process & proc);
    bool operator == (const Process & other);
    proc_ty get_type(){
        return type;
    }
    const Scalar & scalar()const{
        assert(type == SCALAR);
        return *static_cast<Scalar *>(data);
    }
    const Loop & loop()const{
        assert(type == LOOP);
        return *static_cast<Loop *>(data);
    }
};
struct code_item{
    vector<Memory> inputs;
    vector<Memory> outputs;
    Process proc;
    string to_string();
};
using code_sequ = vector<code_item>;

union scalar_data{
    op::bin_core bin;
    op::uni_core uni;
};
class Scalar{
protected:
    scalar_ty type;
    scalar_data data;
public:
    Scalar(op::bin_core bin){
        type = BIN;
        data.bin = bin;
    }
    Scalar(op::uni_core uni){
        type = UNI;
        data.uni = uni;
    }
    bool operator == (Scalar other)const{
        if(other.type != type){
            return false;
        }
        switch(type){
        case BIN: return data.bin == other.data.bin;
        case UNI: return data.uni == other.data.uni;
        default: assert(false && "bad case value");
        }
    }
    scalar_ty get_type(){
        return type;
    }
    op::bin_core bin(){
        assert(type == BIN);
        return data.bin;
    }
    op::uni_core uni(){
        assert(type == UNI);
        return data.uni;
    }
};
static const string loop_idx = "i";
struct Loop{
    code_sequ sequ;
    size_t num_iters=1;
    //for nested loops
    /*size_t begin;
    size_t end;
    ptrdiff_t inc;*/
    void inc_loop_count(){
        num_iters++;
    }
    void add_initial(code_item & ci){
        sequ.push_back(ci);
    }
    bool same_as_first(code_item & ci){
       code_item & fi = sequ.front();
       return types_same(ci,fi);
    }
    bool same_as_partner(size_t li,code_item & ci){
        code_item pi = sequ[li];
        return types_same(ci,pi);
    }
    void add_partner(size_t li,code_item & ci){
        assert(same_as_partner(li,ci));
        code_item & pi = sequ[li];
        
        auto conv_vec = [this](vector<Memory> & memchange,vector<Memory> & nextmem){
            assert(memchange.size() == nextmem.size());
            for(size_t i : range(memchange.size())){
                add_index_to(memchange[i],nextmem[i]);
            }
        };
        conv_vec(pi.inputs,ci.inputs);
        conv_vec(pi.outputs,ci.outputs);
    }
    bool indexizable(size_t li,code_item & ci){
        auto is_indexizable = [this](vector<Memory> & loopmem,vector<Memory> & mem){
            assert(loopmem.size() == mem.size());
            for(size_t i : range(mem.size())){
                size_t start = loopmem[i].get_0_offset();
                size_t end = mem[i].get_0_offset();
                if((end - start) != loopmem[i].cur_mul_val()*num_iters){
                    return false;
                }
            }
            return true;
        };
        
        code_item pi = sequ[li];
        return types_same(ci,pi) && is_indexizable(pi.inputs,ci.inputs) && is_indexizable(pi.outputs,ci.outputs);
    }
protected:
    bool stats_same(code_item & ci,code_item & li){
        return ci.proc == li.proc &&
                ci.inputs.size() == li.inputs.size() && 
                ci.outputs.size() == li.outputs.size();
    }
    bool types_same(code_item & ci,code_item & li){
        return stats_same(ci,li) && 
                all_of(size_t(0),ci.inputs.size(),[&](size_t idx){
                   return li.inputs[idx].get_type() == ci.inputs[idx].get_type();
                }) && 
                all_of(size_t(0),ci.outputs.size(),[&](size_t idx){
                   return li.outputs[idx].get_type() == ci.outputs[idx].get_type();
                });
    }
    void add_index_to(Memory & memstart,Memory memnext){
        size_t start = memstart.get_0_offset();
        size_t end = memnext.get_0_offset();
        ptrdiff_t diff = ptrdiff_t(end) - ptrdiff_t(start);
        memstart.add_index(diff,loop_idx);
    }
};
inline Process::Process(const Scalar & sca):
    type(SCALAR),
    data(new Scalar(sca)){}

inline Process::Process(const Loop & loop):
    type(LOOP),
    data(new Loop(loop)){}

inline Process & Process::operator = (const Process & proc){
    type = proc.type;
    switch (type) {
    case LOOP:  data = new Loop(proc.loop());break;
    case SCALAR:data = new Scalar(proc.scalar());break;   
    case NOPROC:ExitError("null process stringified");
    }
    return *this;
}
inline bool Process::operator == (const Process & other){  
    if(type != other.type){
        return false;
    }
    switch (type) {
    case LOOP: assert(false && "loop equality not implemented");
    case SCALAR:return scalar() == other.scalar();      
    case NOPROC: assert(false && "no proc equality shouldn't be called");
    default: assert(false && "bad case value");
    }
}

inline string scalar_to_string(Scalar sca,vector<string> args,string ret){
    string source;
    switch(sca.get_type()){
    case BIN:
        assert(args.size() == 2);
        source =  bin_str(args[0],args[1],sca.bin());
        break;
    case UNI:
        assert(args.size() == 1);
        source =  uni_str(args[0],sca.uni());
        break;
    default: assert(false && "bad case value");
    }
    return assign_str(ret,source);
}
inline string loop_to_string(Loop sca){
    string res;
    res += "for(size_t i = 0; i < "+to_string(sca.num_iters) + ";i++) {\n";
    for(code_item & li : sca.sequ){
        res += li.to_string();
    }
    res += "}\n";
    return res;
}
inline string code_item::to_string(){
    switch(proc.get_type()){
    case SCALAR:
        assert(outputs.size() == 1);
        return scalar_to_string(proc.scalar(),construct_vec<vector<string>>(inputs,[](Memory loc){return loc.acc_string();}),outputs.front().acc_string());
    case LOOP:
        return loop_to_string(proc.loop());
    case NOPROC:assert(false && "null process stringified");
    default: assert(false && "bad case value");
    }
}
}
