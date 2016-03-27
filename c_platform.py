import group
import subprocess
import numbers
from shutil import copyfile
from compiler import *
from cffi import FFI
from NumVal import NumVal
import graph
from io import StringIO

class Kernel:
    def __init__(self,platform,new_inputs,start_meds,end_meds,final_outs,const_groups):
        def make_ffi_t(groups):
            g_data = group.concatenate(groups).data
            return [platform.ffi.new("mark_ty[]",g_data), len(g_data)]
        self.platform = platform
        self.id = platform.cpp_code.make_kern(*([platform.plat]+
                    make_ffi_t(new_inputs)+
                    make_ffi_t(final_outs)+
                    make_ffi_t(start_meds)+
                    make_ffi_t(end_meds)+
                    make_ffi_t(const_groups)))
        self.output_size = len(group.concatenate(final_outs))
        self.outputs = []

    def _add_outputs(self, outputs):
        self.outputs.append(outputs)

    def get_outputs(self):
        return self.outputs

    def clear_outputs(self):
        self.outputs = []

header_str = """
typedef void basic_plat;
typedef uint64_t mark_ty;
basic_plat * new_plat(const char * name);
void delete_plat(basic_plat * plat);
mark_ty add_bin(basic_plat * plat, mark_ty left, mark_ty right, uint32_t n_op);
mark_ty add_uni(basic_plat * plat,mark_ty source,uint32_t n_op);
mark_ty add_input(basic_plat * plat,uint32_t n_op);
mark_ty add_initilized_i(basic_plat * plat,int64_t value,uint32_t n_op);
mark_ty add_initilized_f(basic_plat * plat,double value,uint32_t n_op);
void compile(basic_plat * plat);
void init_consts(basic_plat * plat);
//inputs is an array of multiple sets of inputs back to back. The size is dependednt on the kernel info and the number of iters
void run(basic_plat * plat, uint64_t kern_id, float *inputs, float *outputs, uint64_t num_iters);
uint64_t make_kern(basic_plat * plat,
                   mark_ty * new_in_nodes,size_t new_in_size,
                   mark_ty * final_out_nodes,size_t final_out_size,
                   mark_ty * inter_in_nodes,size_t inter_in_size,
                   mark_ty * inter_out_nodes,size_t inter_out_size,
                   mark_ty * const_nodes,size_t const_size);
void place_data_into(basic_plat * plat, float *out_data, mark_ty * in_markers, size_t num_marks);
"""
NUMTY = "float"
class Platform:
    def __init__(self,name,mathlib):
        self.name = name#this is a distinct name that is used for differenciating files of different platforms
        self.mathlib = mathlib

        subprocess.call(["bash", "make.sh"])

        self.ffi = FFI()

        self.ffi.cdef(header_str)

        self.cpp_code = self.ffi.dlopen("./backend_bin/cpp_code.so")

        self.plat = self.cpp_code.new_plat(str.encode(name))

    def compile(self):
        self.cpp_code.compile(self.plat)

    def run(self,kern,in_lists):
        in_list = []
        for il in in_lists:
            for l in il:
                in_list += l

        in_size = len(in_list)
        cffibuf = self.ffi.new(NUMTY+"[]",in_size)
        for i in range(in_size):
            cffibuf[i] = in_list[i]

        num_iters = len(in_list)
        outbuf = self.ffi.new(NUMTY+"[]",num_iters * kern.output_size)
        self.cpp_code.run(self.plat,kern.id,cffibuf,outbuf,num_iters)

        kern._add_outputs(outbuf)

    def init_consts(self):
        self.cpp_code.init_consts(self.plat)

    def make_kernel(self,new_inputs,start_meds,end_meds,final_outs,const_groups):
        def make_ffi_t(groups):
            g_data = group.concatenate(groups).data
            return [self.ffi.new("mark_ty[]",g_data), len(g_data)]
        return Kernel(self,new_inputs,start_meds,end_meds,final_outs,const_groups)

    def fast_get_data(self,markers):
        newbuf = self.ffi.new(NUMTY+"[]",len(markers))
        self.cpp_code.place_data_into(self.plat,newbuf,markers,len(markers))
        return newbuf

    def get_data(self,group):
        return self.fast_get_data(group.data)

    def add_group(self,size):
        return self.add_const([float(0)]*size)

    def add_const(self,values):
        if isinstance(values,numbers.Number):
            val_list = [self.generate_const(values)]
        elif len(values) == 0:
            raise CompileError("add_const called with a list of size zero")
        else:
            val_list = [self.generate_const(v) for v in values]
        #else is a list of numbers
        return group.Group(val_list,self)

    def generate_un(self,oper,source):
        return self.cpp_code.add_uni(self.plat,source,oper)
    def generate_bin(self,oper,left,right):
        return self.cpp_code.add_bin(self.plat,left,right,oper)
    def generate_const(self,num):
        return self.cpp_code.add_initilized_f(self.plat,num,self.mathlib.const_float)
