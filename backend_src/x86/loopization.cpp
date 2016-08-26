#include <cassert>
#include <queue>
#include <headerlib/RangeIterator.h>
#include "disopt_kern.h"
#include "utility.h"
#include "x86/dis_op_process.h"
#include "graph_pqueue.h"

using namespace sequencial;

const static size_t NUM_REGISTERS = 8;
const static size_t C1_SIZE = 1<<(16-4);

double cost(Memory mem){
    return 0;
}
code_sequ code_loopization(comp_graph & graph){
    code_sequ mainseq;
    const size_t gsize = graph.nodes.size();
    const size_t memsize = graph.mem.size();
    vector<bool> computed(memsize,false);
    vector<bool> computable(gsize,false);
    
    graph_pqueue queue(gsize);
    auto mem_computed = [&](size_t memidx){
        computed[memidx] = true;
        for
    };

    for(size_t gidx : range(gsize)){
        compute_node & node = graph.nodes[gidx];
        if(node.meminputs.size() == 0){
            computed[gidx] = true;
        }
    }
}
