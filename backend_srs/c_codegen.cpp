#include <algorithm>
#include <sstream>
<<<<<<< HEAD
#include <RangeIterator.h>
=======
#include "headerlib/RangeIterator.h"
>>>>>>> master
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

string assign_str(string source,string dest){
    return source + "=" + dest + ";";
}
string binary_op(string firstop, string secop,string opstr){
    return sur_paren(firstop + opstr + secop);
}
string bin_str(string firstop, string secop, oper inop){
    //FCONST=op::float_num|op::const_num|0,FINPUT=op::float_num|op::input_num|8,
    //          FNEG = op::float_num|op::uni_num|1,FAPPROXEXP = op::float_num|op::uni_num | 2, FMOV = op::float_num|op::uni_num|7,
    //          FADD = op::float_num|op::bin_num|3,FMUL=op::float_num|op::bin_num|4,FDIV=op::float_num|op::bin_num|5,FSUB=op::float_num|op::bin_num|6
    if(!op::is_bin(inop)){
        ExitError("bin_str called with non-binary operation");
    }
    switch(inop){
    case oper::FADD:return binary_op(firstop,secop,"+");
    case oper::FMUL:return binary_op(firstop,secop,"*");
    case oper::FSUB:return binary_op(firstop,secop,"-");
    case oper::FDIV:return binary_op(firstop,secop,"/");
    default:
        ExitError("Cannot find string of unknown binary operation");
        return "";
    }
}

string uni_str(string source, oper inop){
    if(!op::is_uni(inop)){
        ExitError("uni_str called with non-unary operation");
    }
    switch(inop){
    case oper::FNEG:      return fun_str("-",{source});
    case oper::FAPPROXEXP:return fun_str("exp",{source});
    case oper::FMOV:      return fun_str("",{source});
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
