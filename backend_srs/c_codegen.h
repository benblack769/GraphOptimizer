#pragma once
#include <vector>
#include <string>
#include <sstream>
#include <iomanip>
#include "oper.h"
#include "graph_types.h"

//assign string also terminates the line
std::string assign_str(std::string source,std::string dest);

std::string bin_str(std::string firstop, std::string secop, op::bin_core inop);
std::string uni_str(std::string source, op::uni_core inop);
std::string fun_str(std::string fun_rep,std::vector<std::string> args);

std::string access_idx(std::string arrname,std::size_t index);

template<typename num_ty>
std::string to_num(num_ty val){
    std::stringstream str;
    str << std::fixed << std::setprecision( 16 ) << val;
    return str.str();
}
