#include <cassert>
#include <queue>
#include <algorithm>
#include <iostream>
#include <headerlib/RangeIterator.h>
#include "disopt_kern.h"
#include "utility.h"
#include "x86/dis_op_process.h"
#include "graph_pqueue.h"

using namespace sequencial;

const static size_t NUM_REGISTERS = 8;
const static size_t C1_SIZE = 1<<(16-4);

double cost(Memory ){
    return 0;
}
using mem_arr = vector<double>;
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

code_sequ disopt_kern::code_loopization(comp_graph graph,size_t stored_arr_size){
    code_sequ mainseq;
    cout.clear();
    const size_t gsize = graph.nodes.size();
    const size_t memsize = graph.mem.size();
    vector<Memory> itern_abs(memsize,Memory{0,NOBUF});//maps abstract memory to internal
    vector<size_t> abs_intern(memsize,nullidx);//maps internal memory to abstract memory
    mem_imp impl(this->fin_outs.size(),this->new_ins.size(),stored_arr_size);
    /*
    Main requirements:
    
    1. Get node output location in memory (without assigning the mem_map)
    2. Set costs of memory read/write (affecting costs of all the node which depend on that data and are active)
    3. Maintain a queue of avaliable internal memory costs (for assigning temorary outputs).
    4. Maintain a queue of avaliable node compute costs. (for deciding optimal cost).
    5. mem_map and impl should maintain a nice bidirectional relationship at all times for active memory.
    6. Abstract mechanism for altering memory read/write costs.
    7. Temporary outputs will be placed in liniar chunks. 
    */
    auto map_vec = [&](vector<size_t> & abs_mem){
        vector<Memory> res(abs_mem.size());
        for(size_t i : range(abs_mem.size())){
            res[i] = itern_abs[abs_mem[i]];
        }
        return res;
    };
    auto set_memory = [&](Memory phys_mem,size_t abs_mem){
        impl.buf_vec(phys_mem.get_type()).at(phys_mem.get_0_offset()) = cost(phys_mem);
        abs_intern[phys_mem.get_0_offset()] = abs_mem;
        itern_abs[abs_mem] = phys_mem;
    };
    auto get_temp_out = [&](size_t abs_mem){
        Memory this_mem(impl.interal.size(),INTERNAL);
        impl.interal.emplace_back();
        set_memory(this_mem,abs_mem);
        return this_mem;
    };
    auto temp_outs = [&](vector<size_t> & abs_mem){
        vector<Memory> res(abs_mem.size());
        for(size_t i : range(abs_mem.size())){
            res[i] = get_temp_out(abs_mem[i]);
        }
        return res;
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
        
        vector<Memory> inputs = map_vec(node.meminputs);
        vector<Memory> outputs = temp_outs(node.memoutputs);
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
    vector<code_item> cis(gsize);
    for(size_t i : range(gsize)){
        Scalar * sca =  new Scalar(make_real_code_item(i));
        cis[i] = code_item(sca);
    }
    cout << "finished realiteming "<< gsize << endl;
    size_t nn = 0;
    while(nn < gsize){
        Loop curl;
        curl.add_initial(cis[nn]);
        nn++;
        constexpr size_t MAX_SEQU_SIZE = 3;//stops unique first followed by tons of non-unique being terreble. Remove when recursive strategy is finished
        while(nn < gsize && !curl.same_as_first(cis[nn]) && curl.sequ.size() <= MAX_SEQU_SIZE){
            curl.add_initial(cis[nn]);
            nn++;
        }
        size_t loopitems = curl.sequ.size();
        if(nn + loopitems < gsize &&
                all_of(size_t(0),loopitems,[&](size_t i){return curl.same_as_partner(i,cis[nn+i]);})){
            
            for(size_t i : range(loopitems)){
                curl.add_partner(i,cis[nn+i]);
            }
            curl.inc_loop_count();
            nn += loopitems;
            
            while(nn + loopitems < gsize &&
                  all_of(size_t(0),loopitems,[&](size_t i){return curl.indexizable(i,cis[nn+i]);})){
                curl.inc_loop_count();
                nn += loopitems;
            }
        }
        mainseq.emplace_back(curl.clone());
    }
    cout << "finshed loopizing" << endl;
    return mainseq;
}
