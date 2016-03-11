#pragma once
#include <cstdint>
class Node;
namespace op{
using op_int_ty = uint32_t;
//these should all be large and unique, and should have an associated function below
constexpr op_int_ty const_num = 0x100000;
constexpr op_int_ty uni_num = 0x200000;
constexpr op_int_ty bin_num = 0x400000;
constexpr op_int_ty input_num = 0x800000;
constexpr op_int_ty int_num = 0x1000000;
constexpr op_int_ty float_num = 0x2000000;
}

//these should be the sum of properties they have, and a unique, small id.
enum class oper: op::op_int_ty{FCONST=op::float_num|op::const_num|0,FINPUT=op::float_num|op::input_num|8,
          FNEG = op::float_num|op::uni_num|1,FAPPROXEXP = op::float_num|op::uni_num | 2, FMOV = op::float_num|op::uni_num|7,
          FADD = op::float_num|op::bin_num|3,FMUL=op::float_num|op::bin_num|4,FDIV=op::float_num|op::bin_num|5,FSUB=op::float_num|op::bin_num|6};

namespace op{
inline op_int_ty _to_int(oper t_op){
    return static_cast<op_int_ty>(t_op);
}
inline bool is_const(oper t_op){
    return (_to_int(t_op) & const_num) != 0;
}
inline bool is_input(oper t_op){
    return (_to_int(t_op) & input_num) != 0;
}
inline bool is_uni(oper t_op){
    return (_to_int(t_op) & uni_num) != 0;
}
inline bool is_bin(oper t_op){
    return (_to_int(t_op) & bin_num) != 0;
}
inline bool is_int(oper t_op){
    return (_to_int(t_op) & int_num) != 0;
}
inline bool is_float(oper t_op){
    return (_to_int(t_op) & float_num) != 0;
}
}
