#include <algorithm>
#include <headerlib/RangeIterator.h>

#include "graph_pqueue.h"
#include "test.h"

using namespace std;
using namespace graph_pqueue_vars;

constexpr size_t queuesize = 12;
static const double vals[queuesize] = {0.3,0.5,-100.2,23,0.4,-1,5,1000,2,0.00001,12,23};
graph_pqueue example_pqueue(){
    graph_pqueue queue(queuesize);
    for(size_t i : range(queuesize)){
        queue.add(i,vals[i]);
    }    
    return queue;
}

bool graph_queue_get_test(){
    graph_pqueue queue = example_pqueue();
    return queue.get_val(4) == 23 && queue.get_val(1) == 0.5;
}

bool graph_queue_sort_test(){
    graph_pqueue queue = example_pqueue();
    double queue_vals[queuesize];
    for(size_t i : range(queuesize)){
        queue_vals[i] = queue.extract_min().val;
    }
    double sorted_vals[queuesize];
    copy(vals,vals+queuesize,sorted_vals);
    sort(sorted_vals,sorted_vals+queuesize);
    return equal(sorted_vals,sorted_vals+queuesize,queue_vals);
}
