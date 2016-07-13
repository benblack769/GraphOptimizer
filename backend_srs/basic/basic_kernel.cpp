#include "basic_kernel.h"
#include "utility.h"
#include "c_codegen.h"
#include <iostream>
#include <algorithm>
using namespace std;

string entry(mark_ty mark){
    return bufname+"["+to_string(mark)+"]";
}
void set_marker_locs_to(vector<bool> & locs,marker_g & marks,bool value){
    for(mark_ty mark : marks){
        locs[mark] = value;
    }
}

basic_kernel::basic_kernel(string inname, GraphBuilder & graph,
             marker_g new_in_nodes,
             marker_g final_out_nodes,
             marker_g inter_in_nodes,
             marker_g inter_out_nodes,
             marker_g const_nodes){
    new_ins = new_in_nodes;
    fin_outs = final_out_nodes;
    inter_ins = inter_in_nodes;
    inter_outs = inter_out_nodes;
    name = inname;

    build_logic_graph(graph,const_nodes);
}
void basic_kernel::build_logic_graph(GraphBuilder & graph,marker_g & const_nodes){
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
            oper myop = graph.node_op[i];
            if(op::is_bin(myop)){
                set_if_should_calc(graph.first[i]);
                set_if_should_calc(graph.second[i]);
            }
            else if(op::is_uni(myop)){
                set_if_should_calc(graph.first[i]);
            }
        }
    }
    for(mark_ty mark = 0; mark < graph.elements(); mark++){
        if(is_important[mark]){
            sorted_all_nodes.push_back(mark);
        }
    }
}
std::string basic_kernel::to_string(GraphBuilder & graph){
    string body_string;// = make_string(depth_sorted,graph);

    for(mark_ty mark : sorted_all_nodes){
        oper mop = graph.node_op[mark];
        if(op::is_bin(mop)){
            body_string += assign_str(entry(mark),bin_str(entry(graph.first[mark]),entry(graph.second[mark]),mop));
        }
        else if(op::is_uni(mop)){
            body_string += assign_str(entry(mark),uni_str(entry(graph.first[mark]),mop));
        }
        else if(op::is_const(mop)){
            //ExitError("runaway constnode");
        }
        else{
            ExitError("hit bad node type");
        }
    }

    for(size_t i = 0; i < inter_ins.size(); i++){
        body_string += assign_str(entry(inter_ins[i]),entry(inter_outs[i]));
    }

    return " void " + fun_str(name,{}) + "{" + body_string + "}";
}
