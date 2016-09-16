#include <algorithm>
#include <sstream>
#include "headerlib/RangeIterator.h"
#include "c_codegen.h"
#include "utility.h"
using namespace std;

string make_line(string str){
    return str + ";\n";
}
string sur_square(string middle){
    return "[" + middle + "]";
}
string sur_paren(string middle){
    return "(" + middle + ")";
}
string sur_curly(string middle){
    return "{" + middle + "}";
}
string join_strs(const string & sep_str,const vector<string> & strs){
    string res;
    for_each(strs.cbegin(),strs.cend() - 1,[&](const string & s){
        res += s;
        res += sep_str;
    });
    res += *(strs.cend() - 1);
    return res;
}
string access_idx(string arrname,size_t index){
    return arrname + sur_square(to_string(index));
}

string assign_str(string source,string dest){
    return source + "=" + dest + ";\n";
}
string binary_op(string firstop, string secop,string opstr){
    return sur_paren(firstop + opstr + secop);
}
string bin_str(string firstop, string secop, bin_core inop){
    switch(inop){
    case bin_core::ADD:return binary_op(firstop,secop,"+");
    case bin_core::MUL:return binary_op(firstop,secop,"*");
    case bin_core::SUB:return binary_op(firstop,secop,"-");
    case bin_core::DIV:return binary_op(firstop,secop,"/");
    default:
        ExitError("Cannot find string of unknown binary operation");
        return "";
    }
}

string uni_str(string source, uni_core inop){
    switch(inop){
    case uni_core::NEG:      return fun_str("-",{source});
    case uni_core::EXP:      return fun_str("expf",{source});
    case uni_core::ASSIGN:   return source;
    default:
        ExitError("Cannot find string of unknown unary operation");
        return "";
    }
}
string fun_str(std::string fun_rep,vector<string> args){
    string res = fun_rep + "(";
    for(int64_t i : range(args.size()-1)){
        res += args[i] + ",";
    }
    if (args.size() > 0)
        res += args.back();
    return res + ")";
}
