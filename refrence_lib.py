from compiler import CompileError
def bin_operthingy(n1,lab,n2):
    return "(%s %s %s)"%(n1,lab,n2)
class add:
    _LABEL = "+"
    def op_code(c_var_name1,c_var_name2):
        return bin_operthingy(c_var_name1,add._LABEL,c_var_name2)
class mul:
    _LABEL = "*"
    def op_code(c_var_name1,c_var_name2):
        return bin_operthingy(c_var_name1,mul._LABEL,c_var_name2)
class sub:
    _LABEL = "-"
    def op_code(c_var_name1,c_var_name2):
        return bin_operthingy(c_var_name1,sub._LABEL,c_var_name2)
class div:
    _LABEL = "/"
    def op_code(c_var_name1,c_var_name2):
        return bin_operthingy(c_var_name1,div._LABEL,c_var_name2)

class approx_exp:
    def op_code(c_var_name):
        return " exp(%s) "% c_var_name

exp_code = '''
//copied from https://github.com/jhjourdan/SIMD-math-prims/blob/master/simd_math_prims.h under MIT licencce.
/* Workaround a lack of optimization in gcc */
#include <math.h>
float exp_cst1 = 2139095040.f;
float exp_cst2 = 0.f;

/* Relative error bounded by 1e-5 for normalized outputs
   Returns invalid outputs for nan inputs
   Continuous error */
float expapprox(float val) {
  union { int i; float f; } xu, xu2;
  float val2, val3, val4, b;
  int val4i;
  val2 = 12102203.1615614f*val+1065353216.f;
  val3 = val2 < exp_cst1 ? val2 : exp_cst1;
  val4 = val3 > exp_cst2 ? val3 : exp_cst2;
  val4i = (int) val4;
  xu.i = val4i & 0x7F800000;
  xu2.i = (val4i & 0x7FFFFF) | 0x3F800000;
  b = xu2.f;

  /* Generated in Sollya with:
     > f=remez(1-x*exp(-(x-1)*log(2)),
               [|1,(x-1)*(x-2), (x-1)*(x-2)*x, (x-1)*(x-2)*x*x|],
               [1,2], exp(-(x-1)*log(2)));
     > plot(exp((x-1)*log(2))/(f+x)-1, [1,2]);
     > f+x;
  */
  return
    xu.f * (0.510397365625862338668154f + b *
            (0.310670891004095530771135f + b *
             (0.168143436463395944830000f + b *
              (-2.88093587581985443087955e-3f + b *
               1.3671023382430374383648148e-2f))));
}'''
exp_header = "float expapprox(float val);"


lib_header = exp_header
lib_code = exp_code