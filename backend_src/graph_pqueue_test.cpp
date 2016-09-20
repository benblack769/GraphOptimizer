#include <algorithm>
#include <iostream>
#include <headerlib/RangeIterator.h>

#include "graph_pqueue.h"
#include "test.h"
#include "utility.h"

using namespace std;

static const vector<double> vals = {0.3,0.5,-100.2,23,0.4,-1,5,1000,2,0.00001,12,23};

using graph_pqueue_d = graph_pqueue<double>;

graph_pqueue_d example_pqueue(){
    graph_pqueue_d queue(vals.size());
    for(size_t i : range(vals.size())){
        queue.add(i,vals[i]);
    }    
    return queue;
}
bool heap_state_valid(graph_pqueue_d queue,vector<double> samedata){
    //whether it can sort the data correctly
    size_t queuesize = samedata.size();
    vector<double> queuedata(queuesize);
    for(size_t i : range(queuesize)){
        queuedata[i] = queue.extract_min().val;
    }
    sort(samedata.begin(),samedata.end());
    return equal(samedata.begin(),samedata.end(),queuedata.begin());
}

bool graph_queue_get_test(){
    graph_pqueue_d queue = example_pqueue();
    return queue.get_val(3) == 23 && queue.get_val(1) == 0.5;
}

bool graph_queue_sort_test(){
    return heap_state_valid(example_pqueue(),vals);
}
bool check_alter(size_t idx,double ammt_change){
    graph_pqueue_d queue = example_pqueue();
    vector<double> data = vals;
    queue.set_val(idx,vals[idx] - ammt_change);
    data[idx] -= ammt_change;
    return heap_state_valid(queue,data);
}

bool alter_state_test(){
    for(int i : range(vals.size())){
        if(!check_alter(i,10) || !check_alter(i,-10)){
            return false;
        }
    }
    return true;
}
