#pragma once
#include <vector>
#include <limits>
#include <cassert>

namespace graph_pqueue_vars{
struct val_idx{
    double val;
    std::size_t idx;
    bool operator < (val_idx & other){
        return val < other.val;
    }
    bool operator > (val_idx & other){
        return val > other.val;
    }
};

static constexpr std::size_t nullidx = -1;

class graph_pqueue{   
    /*
     * Standard binary min-heap with a lookup table to 
     * make value increase/decrease faster.
     * 
     * Called a graph pqueue because a reasonable sized lookup
     * table is an assumption for graphs.
*/
protected:
    using size_t = std::size_t;
    std::vector<val_idx> heap;
    std::vector<size_t> heaptable;
public:
    graph_pqueue(std::size_t maxidx):
        heaptable(maxidx,nullidx){}
    
    void add(std::size_t idx,double val){
        size_t hpos = heap.size();
        heap.push_back(val_idx{val,idx});
        heaptable[idx] = hpos;
        
        move_up(hpos);
    }
    val_idx min(){
        return heap.front();
    }
    void pop(){
        swap_heap_pos(0,heap.size()-1);
        delete_back();
        move_down(0);
    }
    val_idx extract_min(){
        val_idx mindata = min();
        pop();
        return mindata;
    }

    double get_val(size_t idx){
        return heap[heaptable[idx]].val;
    }
    /*
     * untested, do not use until test is written
    void remove(std::size_t idx){         
        size_t btmpos = heap.size()-1;
        size_t hpos = heaptable[idx];
        
        double btmval = heap[btmpos].val;
        double remval = heap[hpos].val;
        
        swap_heap_pos(hpos,heap.size()-1);
        delete_back();
        
        if(remval < btmval){
            move_down(hpos);
        }else{
            move_up(hpos);
        }
    }*/
    void set_val(std::size_t idx,double newval){
        size_t hpos = heaptable[idx];
        double oldval = heap[hpos].val;
        heap[hpos].val = newval;
        if(newval < oldval){
            move_up(hpos);
        }
        else{
            move_down(hpos);
        }
    }
protected:
    size_t parent(size_t child){
        return (child-1)/2;
    }
    size_t child1(size_t parent){
        return parent*2+1;
    }
    size_t child2(size_t parent){
        return child1(parent)+1;
    }
    void delete_back(){
        heaptable[heap.back().idx] = nullidx;
        heap.pop_back();
    }
    void move_up(size_t pos){
        while(pos > 0 && heap[pos] < heap[parent(pos)]){
            swap_heap_pos(pos,parent(pos));
            pos = parent(pos);
        }
    }
    void move_down(size_t pos){
        while(true){
            size_t c1pos = child1(pos);
            size_t c2pos = c1pos+1;
            size_t minchild = nullidx;
            if(c1pos >= heap.size()){
                return;
            }
            else if(c2pos >= heap.size()){
                minchild = c1pos;
            }
            else{
                minchild = heap[c1pos] < heap[c2pos] ? c1pos : c2pos;
            }
            if(heap[minchild] < heap[pos]){
                swap_heap_pos(pos,minchild);
                pos = minchild;
            }
            else{
                break;
            }
        }
    }
    void swap_heap_pos(size_t a,size_t b){
        size_t & apos = heaptable[heap[a].idx];
        size_t & bpos = heaptable[heap[b].idx];
        std::swap(apos,bpos);
        std::swap(heap[a],heap[b]);
    }
};
#undef gqassert

}
