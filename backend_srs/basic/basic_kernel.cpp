#include "basic_kernel.h"
#include "utility.h"
#include "c_codegen.h"
#include "basic/basic_processes.h"
#include <headerlib/RangeIterator.h>
#include <iostream>
#include <algorithm>
#include <functional>
#include <unordered_map>
using namespace std;

void set_marker_locs_to(vector<bool> & locs,marker_g & marks,bool value){
    for(mark_ty mark : marks){
        locs[mark] = value;
    }
}

basic_kernel::basic_kernel(string inname, GraphBuilder & graph, default_process_generator & proc_gen,
             marker_g new_in_nodes,
             marker_g final_out_nodes,
             marker_g inter_inputs,
             marker_g inter_outputs,
             marker_g const_nodes){
    
    new_ins = new_in_nodes;
    fin_outs = final_out_nodes;
    inter_ins = inter_inputs;
    inter_outs = inter_outputs;
    constnodes = const_nodes;
    
    name = inname;
    
    marker_g sorted_nodes;
    sort_needed_nodes(sorted_nodes,graph,const_nodes);
    build_compnode_graph(sorted_nodes,graph,proc_gen);
    initiate_memory(sorted_nodes.size()+new_ins.size()+inter_ins.size());
}
void basic_kernel::sort_needed_nodes(marker_g & out_sorted_nodes,GraphBuilder & graph,marker_g & const_nodes){
    vector<bool> is_important(graph.elements(),false);

    vector<bool> do_not_calc(graph.elements(),false);

    set_marker_locs_to(is_important,inter_outs,true);
    set_marker_locs_to(is_important,fin_outs,true);

    set_marker_locs_to(do_not_calc,new_ins,true);
    set_marker_locs_to(do_not_calc,inter_ins,true);
    set_marker_locs_to(do_not_calc,const_nodes,true);

    auto set_if_should_calc = [&](mark_ty mark){
        if(!do_not_calc[mark]){
            is_important[mark] = true;
        }
    };

    for(int64_t i = is_important.size()-1; i >= 0; i--){
        if(is_important[i] && !do_not_calc[i]){
            for(mark_ty in_mark  : graph.computes[i].inputs){
                set_if_should_calc(in_mark);
            }
        }
    }
    for(mark_ty mark = 0; mark < graph.elements(); mark++){
        if(is_important[mark]){
            out_sorted_nodes.push_back(mark);
        }
    }
}
unordered_map<mark_ty,size_t> ty_mark_map(marker_g & sorted_nodes, GraphBuilder & graph,function<bool(start::obj)> is_of_type){
    unordered_map<mark_ty,size_t> res;
    size_t idx = 0;
    for(mark_ty mark : sorted_nodes){
        if(is_of_type(graph.computes[mark])){
            res[mark] = idx;
            idx++;
        }
    }
    return res;
}
unordered_map<mark_ty,size_t> mark_to_buf_idx(const marker_g & all_marks){
    unordered_map<mark_ty,size_t> res;
    for(size_t idx = 0; idx < all_marks.size(); idx++){
        res[all_marks[idx]] = idx;
    }
    return res;
}
vector<size_t> mapped_marks(marker_g & marks,unordered_map<mark_ty,size_t> & map){
    vector<size_t> out(marks.size());
    for(size_t i = 0;i  < marks.size(); i++){
        out[i] = map[marks[i]];
    }
    return out;
}

void basic_kernel::build_compnode_graph(marker_g & sorted_nodes, GraphBuilder & graph, default_process_generator & proc_gen){
    nodes.clear();
    unordered_map<mark_ty,size_t> input_map = mark_to_buf_idx(new_ins);
    marker_g eff_sorted_nodes = combine(combine(combine(new_ins,inter_ins),constnodes),sorted_nodes);
    unordered_map<mark_ty,size_t> mem_map = mark_to_buf_idx(eff_sorted_nodes);
    
    auto read_in = [&](size_t memid,size_t bufidx,string bufname){
        process * nodeproc = proc_gen.store_proc(procptr(new info_input{bufidx,bufname}));
        nodes.push_back(compute_node{{},nodeproc,memid,nodes.size(),true});
    };
    for(mark_ty mark : new_ins){
        read_in(mem_map[mark],input_map[mark],names::INPUT_ARR);
    }
    marker_g read_stored = combine(inter_ins,constnodes);
    for(mark_ty mark : read_stored){
        read_in(mem_map[mark],mark,names::STORED_ARR);
    }
    for(mark_ty mark : sorted_nodes){
        using namespace start;
        obj node = graph.computes[mark];
        size_t memid = mem_map[mark];
        /*for(mark_ty m : node.inputs){
            register_input_for(m,memid);
        }*/
        process * nodeproc = nullptr;
        switch(node.ty){
        case CONST:
            nodeproc = proc_gen.store_proc(procptr(new const_float_val{node.myunion.const_d.val}));
            break;
        case BIN:
            nodeproc = proc_gen.store_proc(procptr(new bin_op_proc{node.myunion.bin_d.op}));
            break;
        case UN:
            nodeproc = proc_gen.store_proc(procptr(new uni_op_proc{node.myunion.un_d.op}));
            break;
        case STORED_READ:
            ExitError("stray stored value in computation");
            break;
        case INPUT:
            nodeproc = proc_gen.store_proc(procptr(new info_input{input_map[node.myunion.in_d.mark],names::INPUT_ARR}));
            break;
        default:
            ExitError("weird type");
            break;
        };
        vector<size_t> memins = node.inputs;
        
        nodes.push_back(compute_node{mapped_marks(node.inputs,mem_map),nodeproc,memid,nodes.size(),true});
    }
    auto read_out = [&](size_t inmemidx,size_t bufidx,string bufname){
        process * nodeproc = proc_gen.store_proc(procptr(new final_output{bufidx,bufname}));
        nodes.push_back(compute_node{{inmemidx},nodeproc,0,nodes.size(),false});
    };
    
    for(size_t i = 0; i < inter_outs.size(); i++){
        read_out(mem_map[inter_outs[i]],inter_ins[i],names::STORED_ARR);
    }
    unordered_map<mark_ty,size_t> output_map = mark_to_buf_idx(fin_outs);
    for(mark_ty mark : fin_outs){
        read_out(mem_map[mark],output_map[mark],names::OUTPUT_ARR);
    }
    cout << "node creation complete" << endl;
}
void basic_kernel::initiate_memory(size_t memsize){
    memory.resize(memsize);
    
    for(size_t nidx: range(nodes.size())){
        compute_node node = nodes[nidx];
        
        memory[node.memoutput].compnodeidx = nidx;
        
        for(size_t midx : node.meminputs){
            memory[midx].compdestids.push_back(nidx);
        }
    }
}
vector<string> get_access_list(string buf,vector<size_t> intargs){
    vector<string> res;
    for(size_t arg : intargs){
        res.push_back(access_idx(buf,arg));
    }
    return res;
}

std::string basic_kernel::to_string(){
    string body_string;
    body_string += "static float "+names::TEMP_KERN_BUF+"["+std::to_string(memory.size())+"];";    
    for(compute_node n : nodes){
        string compstr = n.proc->compute(0,get_access_list(names::TEMP_KERN_BUF,n.meminputs));
        body_string += n.has_output ? 
                            assign_str(access_idx(names::TEMP_KERN_BUF,n.memoutput),compstr) :
                            compstr + ";";
    }
    
    return " void " + fun_str(name,{"const float *"+names::INPUT_ARR,"float *"+names::OUTPUT_ARR}) + "{" + body_string + "}";
}
