#pragma once
#include <string>
#include <iostream>
#include <vector>
#include "basic/basic_plat.h"
#include "cpp_interface/group.h"
#include <headerlib/construct_help.hpp>
#include <headerlib/RangeIterator.h>

using Group = std::vector<Node>;

class Kernel{
public:
    uint64_t kern_id;
    size_t out_size;
    std::vector<float> all_outputs;
    Kernel():
        kern_id(-1){}
    Kernel(uint64_t inkern_id):
        kern_id(inkern_id){}
};

class Platform{
/*
 * Wrapper over the c interface platform.
*/
public:
    basic_plat * plat_impl;
    Platform(std::string name){
        plat_impl = new_plat(name.c_str());
    }
    ~Platform(){
        delete_plat(plat_impl);
    }
    void compile(){
        ::compile(plat_impl);
    }
    void init_stored(){
        ::init_stored(plat_impl);
    }
    void run(const Kernel & kern,const std::vector<float> & inputs,std::vector<float> & outputs,uint64_t num_iters){
        ::run(plat_impl,kern.kern_id,inputs.data(),outputs.data(),num_iters);
    }
    Kernel make_kern(Group new_ins,
                     Group final_outs,
                     Group inter_ins,
                     Group inter_outs,
                     Group const_nodes){
        return Kernel(::make_kern(plat_impl,
                                  to_marks(new_ins).data(),new_ins.size(),
                                  to_marks(final_outs).data(),final_outs.size(),
                                  to_marks(inter_ins).data(),inter_ins.size(),
                                  to_marks(inter_outs).data(),inter_outs.size(),
                                  to_marks(const_nodes).data(),const_nodes.size()));
    }
    marker_g to_marks(const Group & g){
        return construct_vec<marker_g>(g,[](Node n){return n.get_mark();});
    }
    Group inputs(size_t size){
        Group g(size);
        for(size_t i : range(size)){
            g[i] = Node(plat_impl,add_input(plat_impl));
        }
        return g;
    }
    Group consts(const std::vector<float> & const_vals){
        size_t size = const_vals.size();
        Group g(size);
        for(size_t i : range(size)){
            g[i] = const_node(const_vals[i]);
        }
        return g;
    }
    Node const_node(float val){
        return Node(plat_impl,add_const_f(plat_impl,val));
    }
    Group stored_vals(const std::vector<float> & init_vals){
        size_t size = init_vals.size();
        Group g(size);
        for(size_t i : range(size)){
            g[i] = Node(plat_impl,add_init_val(plat_impl,init_vals[i]));
        }
        return g;
    }
};
