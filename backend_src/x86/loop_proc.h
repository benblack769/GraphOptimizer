#pragma once
#include <vector>
#include <cstdint>
#include <cassert>
#include <typeinfo>
#include <string>
#include <algorithm>
#include <iostream>
#include "c_codegen.h"
#include "utility.h"
#include <headerlib/construct_help.hpp>
#include "x86/mem_impl.h"
#include "abs_process.h"

using namespace std;
namespace sequencial{

struct Memstart{
    Memory * loopmem;
    size_t startidx;
};
class Loop:
        public Process{
public:
    code_sequ sequ;
    size_t num_iters = 1;
    string loop_idx;
    //for nested loops
    /*size_t begin;
    size_t end;
    ptrdiff_t inc;*/
    void operator =(Loop & other)=delete;
    Loop(Loop & other)=delete;
    Loop(string inloop_idx):
        loop_idx(inloop_idx){}
    
    unique_ptr<Process> clone(){
        Loop * newl = new Loop(loop_idx);
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
       return  fi->stats_same(*ci) && types_same(ci->mems(),fi->mems(),false);
    }
    bool same_as_partner(size_t li,code_item & ci){
        code_item & pi = sequ[li];
        return pi->stats_same(*ci) && types_same(ci->mems(),pi->mems(),false);
    }
    void add_partner(size_t li,code_item & ci){
        assert(same_as_partner(li,ci));
        code_item & pi = sequ[li];
        
        vector<Memory *> memchange = pi->mems();
        vector<Memory *> nextmem = ci->mems();
        
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
        if(!types_same(mem,loopmem,true)){
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
        const Loop & loop = *reinterpret_cast<const Loop *>(&other);
        if(num_iters != loop.num_iters || loop_idx != loop.loop_idx || sequ.size() != loop.sequ.size()){
            return false;
        }
        return all_of(0,sequ.size(),[&](size_t i){
            return sequ[i]->stats_same(*loop.sequ[i]);
        });
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
        res += "for(size_t "+loop_idx+" = 0; "+loop_idx+" < " + std::to_string(num_iters) + ";"+loop_idx+"++) {\n";
        for(code_item & li : sequ){
            res += li->to_string();
        }
        res += "}\n";
        return res;
    }
protected:
    bool types_same(const vector<Memory *> & mem_1,const vector<Memory *> & mem_2,bool ignore_m1back){
        return mem_1.size() == mem_2.size() &&
                all_of(size_t(0),mem_1.size(),[&](size_t idx){
                    return mem_1[idx]->get_type() == mem_2[idx]->get_type()
                            && mem_1[idx]->same_idxvals(*mem_2[idx],ignore_m1back);
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
