#include <cassert>
#include <queue>
#include <algorithm>
#include <iostream>
#include <headerlib/RangeIterator.h>
#include "disopt_kern.h"
#include "utility.h"
#include "x86/loop_proc.h"
#include "x86/scalar_proc.h"
#include "graph_pqueue.h"

using namespace sequencial;

const static size_t NUM_REGISTERS = 8;
const static size_t C1_SIZE = 1<<(16-4);

void loopize(code_sequ & sequ,string loopidx);

double cost(Memory ){
    return 0;
}
using mem_arr = vector<size_t>;
struct mem_imp{
    mem_imp(size_t outsize,size_t insize,size_t stored_size):
        output(outsize),
        input(insize),
        stored(stored_size),
        interal(){}
    mem_arr output;
    mem_arr input;// no vector but internal actually is initialized ever
    mem_arr stored;
    mem_arr interal;
    mem_arr & buf_vec(buf_ty ty){
        switch(ty){
        case OUTPUT:return output;
        case STORED:return input;
        case INPUT:return stored;
        case INTERNAL:return interal;
        case CONSTANT:
        case NOBUF:assert(false && "memory fetched for non-existent buffer");
        default: assert(false && "bad case value");
        }
    }
    /*
    Memory forward_neighbor(Memory mem,ptrdiff_t offset){
        if(mem.get_type() == NOBUF){
            return Memory();
        }
        mem_arr & buf = buf_vec(mem.type);
        assert(mem.offset < buf.size() && mem.offset >= 0);
        return (mem.offset < buf.size()-1) ? Memory{mem.offset+1,mem.type} : Memory();
    }
    mem_cost & cost(Memory mem){
        return buf_vec(mem.type).at(mem.offset);
    }
    mem_cost & frwd_neigh_cost(Memory mem){
        return buf_vec(mem.type).at(mem.offset+1);
    }*/
};

code_sequ disopt_kern::gen_unloopized_sequ(comp_graph graph,size_t stored_arr_size){
    const size_t memsize = graph.mem.size();
    const size_t gsize = graph.nodes.size();
    this->intern_size = 0;
    vector<size_t> abs_intern(memsize,size_t(-1));
    vector<size_t> memcounts(memsize,0);
    vector<size_t> free_interns;
    code_sequ sequ;
    
    auto get_temp_out = [&](size_t abs_mem){
        size_t intern_loc;
        if(free_interns.size()){
            intern_loc = free_interns.back();
            free_interns.pop_back();
        }
        else{
            intern_loc = this->intern_size;
            this->intern_size++;
        }
        assert(memcounts[abs_mem] == 0);
        memcounts[abs_mem] = graph.mem[abs_mem].compdestids.size();
        abs_intern[abs_mem] = intern_loc;
        return Memory(intern_loc,INTERNAL);
    };
    auto get_mem = [&](size_t abs_mem){
        memcounts[abs_mem] -= 1;
        if(memcounts[abs_mem] == 0){
            free_interns.push_back(abs_intern[abs_mem]);
        }
        return Memory(abs_intern[abs_mem],INTERNAL);
    };
    auto get_op_holder = [&](size_t abs_n){
        compute_node & node = graph.nodes[abs_n];
        using namespace abstract;
        switch(node.proc.get_type()){
        case proc_ty::BIN:return op_holder(node.proc.bin_op());
        case proc_ty::UN:return op_holder(node.proc.uni_op());
        case proc_ty::BUF_ACCESS:return op_holder(uni_core::ASSIGN);
        default: assert(false && "bad case value");
        }
    };
    auto make_real_code_item = [&](size_t abs_n){
        compute_node & node = graph.nodes[abs_n];
        
        vector<Memory> inputs = construct_vec<vector<Memory>>(node.meminputs,get_mem);
        vector<Memory> outputs = construct_vec<vector<Memory>>(node.memoutputs,get_temp_out);
        using namespace abstract;
        if(node.proc.get_type() == proc_ty::BUF_ACCESS){
            abstract::access bacc = node.proc.buf_access();
            switch(bacc.ty){
            case abs_buf_ty::CONST:
                inputs.assign({Memory(bacc.idx,buf_ty::CONSTANT)});
                break;
            case abs_buf_ty::INPUT:
                inputs.assign({Memory(bacc.idx,buf_ty::INPUT)});
                break;
            case abs_buf_ty::OUTPUT:
                outputs.assign({Memory(bacc.idx,buf_ty::OUTPUT)});
                break;
            case abs_buf_ty::STORED_READ:
                inputs.assign({Memory(bacc.idx,buf_ty::STORED)});
                break;
            case abs_buf_ty::STORED_WRITE:
                outputs.assign({Memory(bacc.idx,buf_ty::STORED)});
                break;
            }
        }
        return Scalar(inputs,outputs,get_op_holder(abs_n));
    };
    code_sequ csequ(gsize);
    for(size_t i : range(gsize)){
        Scalar * sca =  new Scalar(make_real_code_item(i));
        csequ[i] = code_item(sca);
    }
    return csequ;
}
/*
Main requirements for core ideas:

1. Get node output location in memory (without assigning the mem_map)
2. Set costs of memory read/write (affecting costs of all the node which depend on that data and are active)
3. Maintain a queue of avaliable internal memory costs (for assigning temorary outputs).
4. Maintain a queue of avaliable node compute costs. (for deciding optimal cost).
5. mem_map and impl should maintain a nice bidirectional relationship at all times for active memory.
6. Abstract mechanism for altering memory read/write costs.
7. Temporary outputs will be placed in liniar chunks. 
*/
code_sequ disopt_kern::code_loopization(comp_graph graph,size_t stored_arr_size){
    cout.clear();
//    vector<Memory> itern_abs(memsize,Memory{0,NOBUF});//maps abstract memory to internal
//    vector<size_t> abs_intern(memsize,nullidx);//maps internal memory to abstract memory
//    mem_imp impl(this->fin_outs.size(),this->new_ins.size(),stored_arr_size);

    code_sequ csequ = gen_unloopized_sequ(graph,stored_arr_size);
    cout << "finished realiteming "<< graph.nodes.size() << endl;
    loopize(csequ,"i");
    loopize(csequ,"j");
    cout << "finshed loopizing" << endl;
    return csequ;
}
void loopize(code_sequ & sequ,string loopidx){
    size_t sequsize = sequ.size();
    size_t nn = 0;
    code_sequ loopized;
    while(nn < sequsize){
        constexpr size_t MAX_INDENT_PASSES = 6;
        for(size_t ident_passes : range(MAX_INDENT_PASSES)){
            Loop curl(loopidx);
            size_t loopitems = 0;
            curl.add_initial(sequ[nn]);
            loopitems++;
            constexpr size_t MAX_SEQU_SIZE = 6;//increasing this value allows for more complex loops to be loopized, but at a compile time performance cost
            while(nn+loopitems < sequsize && curl.sequ.size() <= MAX_SEQU_SIZE && (loopitems <= ident_passes || !curl.same_as_first(sequ[nn+loopitems]))){
                curl.add_initial(sequ[nn+loopitems]);
                loopitems++;
            }
            nn += loopitems;
            if(nn + loopitems < sequsize &&
                    all_of(size_t(0),loopitems,[&](size_t i){return curl.same_as_partner(i,sequ[nn+i]);})){
                
                for(size_t i : range(loopitems)){
                    curl.add_partner(i,sequ[nn+i]);
                }
                curl.inc_loop_count();
                nn += loopitems;
                
                bool does_3rd_iteration = false;
                while(nn + loopitems < sequsize &&
                      all_of(size_t(0),loopitems,[&](size_t i){return curl.indexizable(i,sequ[nn+i]);})){
                    curl.inc_loop_count();
                    nn += loopitems;
                    does_3rd_iteration = true;
                }
                if(does_3rd_iteration){
                    loopized.emplace_back(curl.clone());
                    break;//ident passes
                }
                else{
                    //try loop again with next value of ident_passes
                    nn -= loopitems*2;
                }
            }
            else{
                //try loop again with next value of ident_passes
                nn -= loopitems;
            }
        }
        //if it cannot find any partner within MAX_SEQU_SIZE iters, then assume the first item cannot be loopized.
        loopized.push_back(sequ[nn]->clone());
        nn++;
    }
    sequ.swap(loopized);
}

