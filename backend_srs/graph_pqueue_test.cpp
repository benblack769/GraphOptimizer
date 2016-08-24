#include "graph_pqueue.h"
#include "test.h"

using namespace std;

constexpr size_t queuesize = 12;
double vals[queuesize] = {0.3,0.5,-100.2,23,0.4,-1,5,1000,2,0.00001,12,23};
graph_pqueue example_pqueue(){
    graph_pqueue queue(queuesize);
    for(size_t i = 0; i < queuesize; i++){
        queue.add(i,vals[i]);
    }    
    return queue;
}

void graph_queue_test(){
    
}
