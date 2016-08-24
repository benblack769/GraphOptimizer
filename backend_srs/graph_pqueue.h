#pragma once
#include <vector>
#include <limits>
#include <cassert>

#ifdef _GRAPH_PQUEUE_DEBUG_CHECKS
#define gqassert(cond) assert(cond) 
#else
#define gqassert(cond) 
#endif
struct val_idx{
    double val;
    std::size_t idx;
    bool operator < (val_idx & other){
        return val < other.val;
    }
};

class graph_pqueue{
protected:
    using size_t = std::size_t;
    static constexpr size_t nullidx = -1;
    std::vector<val_idx> heap;
    std::vector<size_t> heaptable;
public:
    
    graph_pqueue(std::size_t maxidx):
        heaptable(maxidx,nullidx){}
    
    void add(std::size_t idx,double val){
        size_t hpos = heap.size();
        heap.push_back(val_idx{val,idx});
        move_up(hpos);
    }
    /*
    void remove(size_t idx){
        //remove does not work with this implementation. 
        //To add remove functionality, we need a null val_idx token that we compare to as well as the size
        //in move_down
    }
    */
    val_idx min(){
        return heap.front();
    }
    void pop(){
        swap_heap_pos(0,heap.size()-1);
        move_down(0);
        heap.pop_back();
    }
    val_idx extract_min(){
        val_idx mindata = min();
        pop();
        return mindata;
    }

    double get_val(size_t idx){
        return heap[idx].val;
    }
    double remove(std::size_t idx){         
        size_t btmpos = heap.size()-1;
        size_t hpos = heaptable[idx];
        
        double btmval = heap[btmpos].val;
        double remval = heap[hpos].val;
        
        swap_heap_pos(hpos,heap.size()-1);
        
        if(remval > btmval){
            move_down(hpos);
        }else{
            move_up(hpos);
        }
        heap.pop_back();
    }
    void set_val(std::size_t idx,double newval){
        size_t hpos = heaptable[idx];
        double oldval = heap[hpos].val;
        heap[hpos].val = newval;
        if(newval > oldval){
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
    void move_up(size_t pos){
        while(pos > 0 && heap[pos].val > heap[parent(pos)].val){
            swap_heap_pos(pos,parent(pos));
            pos = parent(pos);
        }
    }
    void move_down(size_t pos){
        while(true){
            size_t c1pos = child1(pos);
            size_t c2pos = c1pos+1;
            if(c1pos < heap.size() && heap[c1pos].val > heap[pos].val){
                swap_heap_pos(pos,c1pos);
                pos = c1pos;
            }
            else if(c2pos < heap.size() && heap[c2pos].val > heap[pos].val){
                swap_heap_pos(pos,c2pos);
                pos = c2pos;
            }
            else{
                break;
            }
        }
    }
    void swap_heap_pos(size_t a,size_t b){
        size_t & aidx = heaptable[heap[a].idx];
        size_t & bidx = heaptable[heap[b].idx];
        std::swap(aidx,bidx);
        heap[a].idx = aidx;
        heap[b].idx = bidx;
        std::swap(heap[a],heap[b]);
    }
};
#undef gqassert
