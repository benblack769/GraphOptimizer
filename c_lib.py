from compiler import CompileError
const_num = 0x100000
uni_num = 0x200000
bin_num = 0x400000
input_num = 0x800000
int_num = 0x1000000
float_num = 0x2000000
#values pulled from oper.h
add = float_num|bin_num|3
sub = float_num|bin_num|6
mul = float_num|bin_num|4
div = float_num|bin_num|5
approx_exp = float_num|uni_num|2
