#pragma once
#include <vector>
#include <cstdint>
#include <cassert>
#include <typeinfo>
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
    bool operator == (Memory other){
        return type == other.type && offset == other.offset;
    }
    ptrdiff_t cur_mul_val(){
        assert(loopvals.size() > 0);
        return loopvals.back().mul_val;
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
enum class scalar_ty{UNI,BIN};

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

class op_holder{
protected:
    scalar_ty stype;
    bin_core _bin;
    uni_core _uni;
public:
    op_holder(bin_core inbin){
        stype = scalar_ty::BIN;
        _bin = inbin;
    }
    op_holder(uni_core inuni){
        stype = scalar_ty::UNI;
        _uni = inuni;
    }
    scalar_ty get_type()const{
        return stype;
    }
    bin_core bin()const{
        assert(stype == scalar_ty::BIN);
        return _bin;
    }
    uni_core uni()const{
        assert(stype == scalar_ty::UNI);
        return _uni;
    }
};
class Scalar:
    public Process{
protected:
    vector<Memory> inputs;
    vector<Memory> outputs;
public:
    op_holder data;
    Scalar(vector<Memory> ins,vector<Memory> outs,op_holder indata):
        inputs(ins),
        outputs(outs),
        data(indata){
        assert(indata.get_type() == scalar_ty::UNI || indata.get_type() == scalar_ty::BIN);
    }
    bool stats_same(const Process & other)const{
        if(typeid(Scalar) != typeid(other)){
            return false;
        }
        const Scalar & other_s = *reinterpret_cast<const Scalar *>(&other);
        if(other_s.data.get_type() != data.get_type()){
            return false;
        }
        /*cout.clear();
        if(data.get_type() == scalar_ty::BIN){
            cout << "mybin = " << static_cast<int>(data.bin()) << endl;
            cout << "obin = " << static_cast<int>(other_s.data.bin()) << endl;
        }*/
        switch(data.get_type()){
        case scalar_ty::BIN: return data.bin() == other_s.data.bin();
        case scalar_ty::UNI: return data.uni() == other_s.data.uni();
        default: assert(false && "bad case value");
        }
    }
    vector<Memory *> mems(){
        vector<Memory *> res;
        for(Memory & mem : inputs) res.push_back(&mem);
        for(Memory & mem : outputs) res.push_back(&mem);
        return res;
    }
    string to_string(){
        string source;
        switch(data.get_type()){
        case scalar_ty::BIN:
            assert(inputs.size() == 2);
            source =  bin_str(inputs[0].to_string(),inputs[1].to_string(),data.bin());
            break;
        case scalar_ty::UNI:
            assert(inputs.size() == 1);
            source =  uni_str(inputs[0].to_string(),data.uni());
            break;
        default: assert(false && "bad case value");
        }
        assert(outputs.size() == 1);
        return assign_str(outputs[0].to_string(),source);
    }
    unique_ptr<Process> clone(){
        return unique_ptr<Process>(new Scalar(*this));
    }
};
static const string loop_idx = "i";
class Loop:
        public Process{
public:
    code_sequ sequ;
    size_t num_iters = 1;
    //for nested loops
    /*size_t begin;
    size_t end;
    ptrdiff_t inc;*/
    void operator =(Loop & other)=delete;
    Loop(Loop & other)=delete;
    Loop()=default;
    
    unique_ptr<Process> clone(){
        Loop * newl = new Loop;
        newl->num_iters = num_iters;
        newl->sequ.reserve(sequ.size());
        for(auto & ci : sequ){
            newl->sequ.push_back(ci->clone());
        }
        return unique_ptr<Process>(newl);
    }
    void inc_loop_count(){
        num_iters++;
    }
    void add_initial(code_item & ci){
        sequ.emplace_back(ci->clone());
    }
    bool same_as_first(code_item & ci){
       code_item & fi = sequ.front();
       return  fi->stats_same(*ci)  && types_same(ci->mems(),fi->mems());
    }
    bool same_as_partner(size_t li,code_item & ci){
        code_item & pi = sequ[li];
        return pi->stats_same(*ci) && types_same(ci->mems(),pi->mems());
    }
    void add_partner(size_t li,code_item & ci){
        assert(same_as_partner(li,ci));
        code_item & pi = sequ[li];
        
        vector<Memory *> memchange = pi->mems();
        vector<Memory *> nextmem = ci->mems();
        assert(types_same(memchange,nextmem));
        
        for(size_t i : range(memchange.size())){
            add_index_to(*memchange[i],*nextmem[i]);
        }
    }
    bool indexizable(size_t li,code_item & ci){
        code_item & pi = sequ[li];
        if(!pi->stats_same(*ci)){
            return false;
        }
        vector<Memory *> loopmem = pi->mems();
        vector<Memory *> mem = ci->mems();
        if(!types_same(mem,loopmem)){
            return false;
        }
        for(size_t i : range(mem.size())){
            size_t start = loopmem[i]->get_0_offset();
            size_t end = mem[i]->get_0_offset();
            if((end - start) != loopmem[i]->cur_mul_val()*num_iters){
                return false;
            }
        }
        return true;
    }
    bool stats_same(const Process & other)const{
        if(typeid(Loop) != typeid(other)){
            return false;
        }
        return true;
    }
    vector<Memory *> mems(){
        vector<Memory *> mems;
        for(code_item & ci : sequ){
            vector<Memory *> cimems = ci->mems();
            mems.insert(mems.end(),cimems.begin(),cimems.end());
        }
        return mems;
    }
    string to_string(){
        string res;
        res += "for(size_t i = 0; i < " + std::to_string(num_iters) + ";i++) {\n";
        for(code_item & li : sequ){
            res += li->to_string();
        }
        res += "}\n";
        return res;
    }
protected:
    bool types_same(const vector<Memory *> & mem_1,const vector<Memory *> & mem_2){
        return mem_1.size() == mem_2.size() &&
                all_of(size_t(0),mem_1.size(),[&](size_t idx){
                    return mem_1[idx]->get_type() == mem_2[idx]->get_type();
                 });
    }
    void add_index_to(Memory & memstart,Memory memnext){
        size_t start = memstart.get_0_offset();
        size_t end = memnext.get_0_offset();
        ptrdiff_t diff = ptrdiff_t(end) - ptrdiff_t(start);
        memstart.add_index(diff,loop_idx);
    }
};
}
