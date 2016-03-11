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
    def __init__(self,ffi,init_fn,kern_id,inter_out_nodes,final_out_nodes,inter_in_nodes,new_in_nodes,const_nodes):


    def get_outputs(self):
        return self.outputs

    def clear_outputs(self):
        self.outputs = []

header_str = """
#include <stdint.h>
struct basic_plat;
basic_plat * new_plat(const char * name);
void delete_plat(basic_plat * plat);
mark_ty add_bin(basic_plat * plat, mark_ty left, mark_ty right, uint32_t n_op);
mark_ty add_uni(basic_plat * plat,mark_ty source,uint32_t n_op);
mark_ty add_input(basic_plat * plat,uint32_t n_op);
mark_ty add_initilized_i(basic_plat * plat,int64_t value,uint32_t n_op);
mark_ty add_initilized_f(basic_plat * plat,double value,uint32_t n_op);
void compile(basic_plat * plat);
void run(basic_plat * plat,uint64_t kern_id,double * inputs);
uint64_t make_kern(basic_plat * plat);
"""
class Platform:
    def __init__(self,name,mathlib):
        self.name = name#this is a distinct name that is used for differenciating files of different platforms
        subprocess.call(["bash","backedn_srs/make.sh"])

        self.ffi = FFI()

        self.ffi.cdef(header_str)

        self.cpp_code = self.ffi.dlopen("cpp_code.so")

        cpp_plat = self.cpp_code.new_plat("argvar")
        self.cpp_code.compile(cpp_plat)

    def compile(self):
        header_str = self.get_header()
        file_str = header_str + self.get_body()
        code_fname = self.name+CODE_FILE_NAME
        fancy_code_fname = self.name+FACNY_FILE_NAME
        dll_fname = self.name+DLL_FILE_NAME
        old_code_name = "old"+code_fname

        save_file(code_fname,file_str)
        if not file_identical(code_fname,old_code_name):
            if will_format:
                #formats and saves c code
                subprocess.Popen(["clang-format","-style=LLVM"],stdin=open(code_fname,"rb"),stdout=open(fancy_code_fname,"wb"))

            subprocess.call(["clang","-std=c99","-O0","-march=native","-shared", "-o", dll_fname, "-fPIC",code_fname])
            copyfile(code_fname, old_code_name)
            #subprocess.run(["clang","-std=c99","-O3","-march=native","-S", code_fname])
            #subprocess.call(["gcc","-std=c99","-O2","-shared", "-S", "-fPIC",code_fname])
        print_debug("compilation finished")

        self.ffi.cdef(header_str)
        self.code_inter = self.ffi.dlopen(dll_fname)

    def run(self,kern,in_lists):
        if self.code_inter == None:
            raise CompileError("Kernel run before platform is compiled!")

        in_list = []
        for il in in_lists:
            for l in il:
                in_list += l

        in_size = len(in_list)
        cffibuf = self.ffi.new(NUMTY+"[]",in_size)
        for i in range(in_size):
            cffibuf[i] = in_list[i]

        kern._run(self.code_inter,self.ffi,cffibuf,self.do_many_fn,len(in_lists))

    def init_consts(self):
        self.init_fn.cffi_call(self.code_inter)

    def make_kernel(self,new_inputs,start_meds,end_meds,final_outs,const_groups):
        kern = Kernel(self.ffi,self.init_fn,len(self.kernels),group.concatenate(end_meds).data,
                                        group.concatenate(final_outs).data,
                                        group.concatenate(start_meds).data,
                                        group.concatenate(new_inputs).data,
                                        group.concatenate(const_groups).data)
        self.kernels.append(kern)
        return kern

    def fast_get_data(self,cffi_markers):
        newbuf = self.ffi.new(NUMTY+"[]",len(cffi_markers))
        cffi_fn(self.code_inter,self.out_fn.name)(cffi_markers,newbuf,len(cffi_markers))
        return newbuf

    def get_data(self,group):
        return self.fast_get_data(get_marker_cffi_buf(self.ffi,group.data))

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
        if not isinstance(source,graph.BasicNode):
            raise CompileError("unary group created with bad source")
        g = graph.UnOpNode(self.buffersize,source,oper)
        self.buffersize += 1
        return g
    def generate_bin(self,oper,left,right):
        if not isinstance(left,graph.BasicNode) or not isinstance(right,graph.BasicNode):
            raise CompileError("binary group created with bad sources")
        g = graph.BinOpNode(self.buffersize,left,right,oper)
        self.buffersize += 1
        return g
    def generate_const(self,num):
        if not isinstance(num,numbers.Number):
            raise CompileError("constant group created with an invalid number")
        g = graph.ConstNode(self.buffersize,num)
        self.buffersize += 1
        return g
