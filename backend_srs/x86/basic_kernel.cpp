#include "basic_kernel.h"
#include <unordered_set>
#include <unordered_map>
#include "utility.h"
#include "c_codegen.h"
using namespace std;


using marker_g = std::vector<mark_ty>;
using mark_set = unordered_set<mark_ty>;
using dest_map = unordered_map<mark_ty,marker_g>;

string bufname = "buf";

string entry(mark_ty mark){
    return bufname+"["+to_string(mark)+"]";
}

std::string make_string(vector<marker_g> & depth_sorted,GraphInfo & graph){
    string mystr;
    for(marker_g & mark_vec : depth_sorted){
        for(mark_ty mark : mark_vec){
            oper mop = graph.node_op[mark];
            if(op::is_bin(mop)){
                mystr += assign_str(entry(mark),bin_str(entry(graph.first[mark]),entry(graph.second[mark]),mop));
            }
            else if(op::is_uni(mop)){
                mystr += assign_str(entry(mark),uni_str(entry(graph.first[mark]),mop));
            }
            else if(op::is_const(mop)){
                ExitError("runaway constnode");
            }
            else{
                ExitError("hit bad node type");
            }
        }
    }
    return mystr;
}

mark_set get_all_nodes(mark_set & const_set,marker_g & inter_out_nodes,marker_g & final_out_nodes,GraphInfo & graph){
    mark_set out_all_nodes;
    marker_g nextnodes = combine(final_out_nodes,inter_out_nodes);
    out_all_nodes = const_set;
    while(nextnodes.size()){
        marker_g newnext;
        for(mark_ty n : nextnodes){
            if(!out_all_nodes.count(n)){
                out_all_nodes.insert(n);
                oper n_op = graph.node_op[n];
                if(op::is_bin(n_op)){
                    newnext.push_back(graph.first[n]);
                    newnext.push_back(graph.second[n]);
                }
                else if (op::is_uni(n_op)){
                    newnext.push_back(graph.first[n]);
                }
            }
        }
        nextnodes.swap(newnext);
    }
    return out_all_nodes;
}
void get_node_dests_and_const_inputs(marker_g & out_new_consts_inputs,dest_map & out_dests,
                      GraphInfo & graph,mark_set & all_nodes,mark_set & const_set){
    
    out_new_consts_inputs.clear();
    out_dests.clear();
    
    for(mark_ty n : all_nodes)
        out_dests[n] = marker_g();
    for(mark_ty n : all_nodes){
        if (const_set.count(n))
            continue;
        oper n_op = graph.node_op[n];
        if(op::is_bin(n_op)){
            out_dests[graph.first[n]].push_back(n);
            out_dests[graph.second[n]].push_back(n);
        }
        else if(op::is_uni(n_op)){
            out_dests[graph.first[n]].push_back(n);
        }
        else if(op::is_const(n_op) || op::is_input(n_op)){
            out_new_consts_inputs.push_back(n);
        }
    }
}
void get_depth_sorted_vs(vector<marker_g> & out_depths,marker_g& all_inputs,GraphInfo & graph, dest_map & dests){
    out_depths.clear();

    mark_set completed_nodes(all_inputs.begin(),all_inputs.end());
    while(out_depths.back().size()){

        marker_g & curnodes = out_depths.size() == 0 ? all_inputs : out_depths.back();

        out_depths.push_back(marker_g());
        marker_g & ncurnodes = out_depths.back();

        for(mark_ty n : curnodes){
            for(mark_ty next : dests[n]){
                oper next_op = graph.node_op[next];
                if(!completed_nodes.count(next) &&
                        (op::is_uni(next_op) ||
                         (op::is_bin(next_op) &&
                          completed_nodes.count(graph.first[next]) &&
                          completed_nodes.count(graph.second[next])))){
                    ncurnodes.push_back(next);
                    completed_nodes.insert(next);
                }
            }
        }
    }
}

basic_kernel::basic_kernel(string inname, GraphInfo & graph,
             marker_g new_in_nodes,
             marker_g final_out_nodes,
             marker_g inter_in_nodes,
             marker_g inter_out_nodes,
             marker_g const_nodes){
    name = inname;

    mark_set const_set(const_nodes.begin(),const_nodes.end());
    
    mark_set all_nodes = get_all_nodes(const_set,inter_out_nodes,final_out_nodes,graph);

    marker_g new_consts_inputs;
    dest_map dests;
    get_node_dests_and_const_inputs(new_consts_inputs,dests,graph,all_nodes,const_set);
    
    marker_g all_inputs = combine(inter_in_nodes,combine(new_in_nodes,combine(const_nodes,new_consts_inputs)));
    
    vector<marker_g> depth_sorted;
    get_depth_sorted_vs(depth_sorted,all_inputs,graph,dests);
    

    this->mystr = fun_str(name,{}) + "{" + make_string(depth_sorted,graph) + "}";
}
std::string basic_kernel::to_string(){
    return this->mystr;
}
