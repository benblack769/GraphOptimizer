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
struct Memory{
protected:
    size_t offset;
    buf_ty type;
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
    size_t get_offset(){
        return offset;
    }
    bool operator == (Memory other){
        return type == other.type && offset == other.offset;
    }
};
class mem_loc{
public:
    ptrdiff_t mul_val;
    size_t offset;
    string idx_name;
    buf_ty buftype;
    mem_loc(buf_ty type,size_t inoffset,string inidxname="",ptrdiff_t inmul_val=1):
        mul_val(inmul_val),
        offset(inoffset),
        idx_name(inidxname),
        buftype(type){} 
    mem_loc():
           mem_loc(NOBUF,size_t(-1)){}
    string acc_string(){
        return buf_name(buftype) + "[" + 
                (idx_name.size() ? 
                "("+to_string(mul_val)+"*"+idx_name+"+"+to_string(offset)+")" : \
                to_string(offset))
                + "]";
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
};
using code_sequ = vector<code_item>;
struct loop_item{
    vector<mem_loc> inputs;
    vector<mem_loc> outputs;
    Process proc;
    string to_string();
};
using loop_sequ = vector<loop_item>;

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
    loop_sequ sequ;
    size_t num_iters=1;
    //for nested loops
    /*size_t begin;
    size_t end;
    ptrdiff_t inc;*/
    void inc_loop_count(){
        num_iters++;
    }
    void add_initial(code_item & ci){
        auto to_memloc = [](vector<Memory> & mems){
            return construct_vec<vector<mem_loc>>(mems,[](Memory mem){
                    return mem_loc{mem.get_type(),mem.get_offset(),loop_idx};
            });
        };
        loop_item fi{to_memloc(ci.inputs),to_memloc(ci.outputs),ci.proc};
        sequ.push_back(fi);
    }
    bool same_as_first(code_item & ci){
       loop_item & fi = sequ.front();
       return types_same(ci,fi);
//               && any_of(size_t(0),ci.inputs.size(),[&](size_t idx){
//                       return is_close(to_first_mem(fi.inputs[idx]),ci.inputs[idx]);
//                   });
    }
    bool same_as_partner(size_t li,code_item & ci){
        loop_item pi = sequ[li];
        return types_same(ci,pi);
    }
    void add_partner(size_t li,code_item & ci){
        assert(same_as_partner(li,ci));
        loop_item & pi = sequ[li];
        
        auto conv_vec = [](vector<mem_loc> & memchange,vector<Memory> & nextmem){
            assert(memchange.size() == nextmem.size());
            for(size_t i : range(memchange.size())){
                memchange[i] = convert_to_indexed(memchange[i],nextmem[i]);
            }
        };
        conv_vec(pi.inputs,ci.inputs);
        conv_vec(pi.outputs,ci.outputs);
    }
    bool indexizable(size_t li,code_item & ci){
        auto is_indexizable = [this](vector<mem_loc> & loopmem,vector<Memory> & mem){
            assert(loopmem.size() == mem.size());
            for(size_t i : range(mem.size())){
                size_t start = loopmem[i].offset;
                size_t end = mem[i].get_offset();
                if((end - start) != loopmem[i].mul_val*num_iters){
                    return false;
                }
            }
            return true;
        };
        
        loop_item pi = sequ[li];
        return types_same(ci,pi) && is_indexizable(pi.inputs,ci.inputs) && is_indexizable(pi.outputs,ci.outputs);
    }
protected:
    Memory to_first_mem(mem_loc thismem){
        return Memory(thismem.offset ,thismem.buftype);
    }
    bool stats_same(code_item & ci,loop_item & li){
        return ci.proc == li.proc &&
                ci.inputs.size() == li.inputs.size() && 
                ci.outputs.size() == li.outputs.size();
    }
    bool is_close(Memory one,Memory other){
        return abs(int64_t(one.get_offset()) - int64_t(other.get_offset())) < 8;
    }
    bool types_same(code_item & ci,loop_item & li){
        return stats_same(ci,li) && 
                all_of(size_t(0),ci.inputs.size(),[&](size_t idx){
                   return li.inputs[idx].buftype == ci.inputs[idx].get_type();
                }) && 
                all_of(size_t(0),ci.outputs.size(),[&](size_t idx){
                   return li.outputs[idx].buftype == ci.outputs[idx].get_type();
                });
    }
    static mem_loc convert_to_indexed(mem_loc memstart,Memory memnext){
        size_t start = memstart.offset;
        size_t end = memnext.get_offset();
        ptrdiff_t diff = ptrdiff_t(end) - ptrdiff_t(start);
        return mem_loc{memstart.buftype,start,loop_idx,diff};
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
    for(loop_item li : sca.sequ){
        res += li.to_string();
    }
    res += "}\n";
    return res;
}
inline string loop_item::to_string(){
    switch(proc.get_type()){
    case SCALAR:
        assert(outputs.size() == 1);
        return scalar_to_string(proc.scalar(),construct_vec<vector<string>>(inputs,[](mem_loc loc){return loc.acc_string();}),outputs.front().acc_string());
    case LOOP:
        return loop_to_string(proc.loop());
    case NOPROC:assert(false && "null process stringified");
    default: assert(false && "bad case value");
    }
}
}
