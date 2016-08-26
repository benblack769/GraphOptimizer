import numbers
import subprocess
from cffi import FFI
import numpy as np
import group
import ctypes
from compiler import CompileError

def np_ptr(np_array,ffi):
    intloc = np_array.ctypes.data
    return ffi.cast("float *",intloc)

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
        out_l = []
        for outb in self.outputs:
            num_iters = len(outb) // self.output_size
            out_l += np.split(outb,num_iters)

        return out_l

    def clear_outputs(self):
        self.outputs = []

header_str = """
typedef void basic_plat;
typedef uint64_t mark_ty;
basic_plat * new_plat(const char * name);
void delete_plat(basic_plat * plat);
mark_ty add_bin(basic_plat * plat,mark_ty left,mark_ty right,int bin_op);
mark_ty add_uni(basic_plat * plat,mark_ty source,int uni_op);
mark_ty add_input(basic_plat * plat);
mark_ty add_init_val(basic_plat * plat,float initval);
mark_ty add_const_f(basic_plat * plat,float value);
void compile(basic_plat * plat);
void init_stored(basic_plat * plat);
//inputs is an array of multiple sets of inputs back to back. The size is dependednt on the kernel info and the number of iters
void run(basic_plat * plat, uint64_t kern_id, const float *inputs, float *outputs, uint64_t num_iters);
uint64_t make_kern(basic_plat * plat,
                   mark_ty * new_in_nodes, size_t new_in_size,
                   mark_ty * final_out_nodes, size_t final_out_size,
                   mark_ty * inter_in_nodes, size_t inter_in_size,
                   mark_ty * inter_out_nodes, size_t inter_out_size,
                   mark_ty * const_nodes, size_t const_size);
void get_stored(basic_plat * plat, float *out_data, mark_ty * in_markers, size_t num_marks);
"""
NUMTY = "float"
class Platform:
    def __init__(self,name,mathlib):
        self.name = name#this is a distinct name that is used for differenciating files of different platforms
        self.mathlib = mathlib

        #subprocess.call(["cmake", "."])
        #subprocess.call(["make", "-j8"])

        self.ffi = FFI()

        self.ffi.cdef(header_str)

        try:
            self.cpp_code = self.ffi.dlopen("./backend_bin/libmain.so")
        except OSError:
            self.cpp_code = self.ffi.dlopen("./backend_bin/libmain.dll")

        self.plat = self.cpp_code.new_plat(str.encode(name))

    def compile(self):
        self.cpp_code.compile(self.plat)

    def run(self,kern,in_lists):
        in_arrays = []
        for l in in_lists:
            in_arrays += l

        inbuf = np.concatenate(in_arrays)

        in_size = len(inbuf)
        num_iters = len(in_lists)
        print(num_iters, kern.output_size)
        outbuf = np.zeros(num_iters * kern.output_size,np.float32)
        self.cpp_code.run(self.plat,kern.id,np_ptr(inbuf,self.ffi),np_ptr(outbuf,self.ffi),num_iters)

        kern._add_outputs(outbuf)

    def init_vals(self):
        self.cpp_code.init_stored(self.plat)

    def make_kernel(self,new_inputs,start_meds,end_meds,final_outs,const_groups):
        return Kernel(self,new_inputs,start_meds,end_meds,final_outs,const_groups)

    def fast_get_data(self,markers):
        newbuf = np.zeros(markers,np.float32)
        self.cpp_code.place_data_into(self.plat,np_ptr(newbuf,self.ffi),markers,len(markers))
        return newbuf

    def get_data(self,group):
        return self.fast_get_data(group.data)

    def add_input_group(self,size):
        if size == 0:
            raise CompileError("add_const called with a list of size zero")
        else:
            node_list = [self.generate_input() for i in range(size)]
            return group.Group(node_list,self)

    def _add_num_group_safely(self,gen_func,values):
        if isinstance(values,numbers.Number):
            val_list = [gen_func(values)]
        elif len(values) == 0:
            raise CompileError("add_const called with a list of size zero")
        else:
            val_list = [gen_func(v) for v in values]
        #else is a list of numbers
        return group.Group(val_list,self)

    def add_const_group(self,values):
        return self._add_num_group_safely(self.generate_const,values)

    def add_init_group(self,values):
        return self._add_num_group_safely(self.generate_initialized,values)

    def generate_un(self,oper,source):
        return self.cpp_code.add_uni(self.plat,source,oper)
    def generate_bin(self,oper,left,right):
        return self.cpp_code.add_bin(self.plat,left,right,oper)
    def generate_input(self):
        return self.cpp_code.add_input(self.plat)
    def generate_const(self,num):
        return self.cpp_code.add_const_f(self.plat,num)
    def generate_initialized(self,num):
        return self.cpp_code.add_init_val(self.plat,num)
