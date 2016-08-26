#include <iostream>
#include <algorithm>
#include <functional>
#include <unordered_map>
#include <headerlib/RangeIterator.h>
#include "basic_kernel.h"
#include "utility.h"
#include "c_codegen.h"
#include "basic/basic_names.h"
using namespace std;

void set_marker_locs_to(vector<bool> & locs,marker_g & marks,bool value){
    for(mark_ty mark : marks){
        locs[mark] = value;
    }
}

basic_kernel::basic_kernel(string inname, GraphBuilder & graph, 
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
    build_compnode_graph(sorted_nodes,graph);
    initiate_memory(sorted_nodes.size()+new_ins.size()+inter_ins.size()+constnodes.size());
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
abs_process to_proc(start::obj node,unordered_map<mark_ty,size_t> & input_map){
    switch(node.ty){
    case start::CONST: return abs_process(node.myunion.const_d.val);
    case start::BIN: return abs_process(node.myunion.bin_d.op);
    case start::UN: return abs_process(node.myunion.un_d.op);
    case start::INPUT: return abs_process(input_map[node.myunion.in_d.mark],abstract::INPUT);
    case start::STORED_READ: ExitError("stray stored value in computation");break;
    default: ExitError("weird type");break;
    };
}

void basic_kernel::build_compnode_graph(marker_g & sorted_nodes, GraphBuilder & graph){
    this->graph.nodes.clear();
    unordered_map<mark_ty,size_t> input_map = mark_to_buf_idx(new_ins);
    marker_g eff_sorted_nodes = combine(combine(combine(new_ins,inter_ins),constnodes),sorted_nodes);
    unordered_map<mark_ty,size_t> mem_map = mark_to_buf_idx(eff_sorted_nodes);
    
    auto read_in = [&](size_t memid,size_t bufidx,abstract::buf_ty bufty){
        this->graph.nodes.push_back(compute_node{{},abs_process(bufidx,bufty),{memid},this->graph.nodes.size()});
    };
    for(mark_ty mark : new_ins){
        read_in(mem_map[mark],input_map[mark],abstract::INPUT);
    }
    marker_g read_stored = combine(inter_ins,constnodes);
    for(mark_ty mark : read_stored){
        read_in(mem_map[mark],mark,abstract::STORED_READ);
    }
    for(mark_ty mark : sorted_nodes){
        using namespace start;
        obj node = graph.computes[mark];
        size_t memid = mem_map[mark];
        this->graph.nodes.push_back(compute_node{mapped_marks(node.inputs,mem_map),to_proc(node,input_map),{memid},this->graph.nodes.size()});
    }
    auto read_out = [&](size_t inmemidx,size_t bufidx,abstract::buf_ty bufty){
        this->graph.nodes.push_back(compute_node{{inmemidx},abs_process(bufidx,bufty),{},this->graph.nodes.size()});
    };
    
    for(size_t i = 0; i < inter_outs.size(); i++){
        read_out(mem_map[inter_outs[i]],inter_ins[i],abstract::STORED_WRITE);
    }
    unordered_map<mark_ty,size_t> output_map = mark_to_buf_idx(fin_outs);
    for(mark_ty mark : fin_outs){
        read_out(mem_map[mark],output_map[mark],abstract::OUTPUT);
    }
    cout << "node creation complete" << endl;
}
void basic_kernel::initiate_memory(size_t memsize){
    this->graph.mem.resize(memsize);
    
    for(size_t nidx: range(this->graph.nodes.size())){
        compute_node node = this->graph.nodes[nidx];
        
        for(size_t memidx : node.memoutputs){
            this->graph.mem[memidx].compnodeidx = nidx;
        }
        
        for(size_t midx : node.meminputs){
            this->graph.mem[midx].compdestids.push_back(nidx);
        }
    }
    cout << "mem creation complete" << endl;
}
vector<string> get_access_list(string buf,vector<size_t> intargs){
    vector<string> res;
    for(size_t arg : intargs){
        res.push_back(access_idx(buf,arg));
    }
    return res;
}
string kb_acc(size_t idx){
    return access_idx(names::TEMP_KERN_BUF,idx);
}

string comp_string(compute_node & node){
    using namespace abstract;
    switch(node.proc.get_type()){
    case CONST:return to_num(node.proc.const_val());
    case BIN:return bin_str(kb_acc(node.meminputs.at(0)),kb_acc(node.meminputs.at(1)),node.proc.bin_op());
    case UN:return uni_str(kb_acc(node.meminputs.at(0)),node.proc.uni_op());
    case BUF_ACCESS:{
        access b_acc = node.proc.buf_access();
        string acc = access_idx(names::buf_name(b_acc.ty),b_acc.idx);
        switch(b_acc.ty){
        case INPUT:
        case STORED_READ:
            return acc;
        case OUTPUT:
        case STORED_WRITE:
            return assign_str(acc,kb_acc(node.meminputs.at(0)));
        }
        }
    }
}

std::string basic_kernel::to_string(){
    string body_string;
    body_string += "static float "+names::TEMP_KERN_BUF+"["+std::to_string(this->graph.mem.size())+"];";    
    for(compute_node node : this->graph.nodes){
        string compstr = comp_string(node);
        body_string += node.memoutputs.size() > 0 ? 
                            assign_str(access_idx(names::TEMP_KERN_BUF,node.memoutputs[0]),compstr) :
                            compstr + ";";
    }
    
    return " void " + fun_str(name,{"const float *"+names::INPUT_ARR,"float *"+names::OUTPUT_ARR}) + "{" + body_string + "}";
}
