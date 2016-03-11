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


class Platform:
    def __init__(self,name,mathlib):
        self.name = name#this is a distinct name that is used for differenciating files of different platforms
        self.mathlib = mathlib
        self.kernels = []
        self.buffersize = 0

        self.init_fn = Function("init_fn")

        self.out_fn = Function("out_fn",["uint64_t * buffptr","Float * outbuff","uint64_t size"],"for(uint64_t i = 0; i < size;i++)\n\toutbuff[i] = %s[buffptr[i]];"%BUFF_NAME)
        self.in_fn = Function("in_fn",["uint64_t * buffptr","Float * inbuff","uint64_t size"],"for(uint64_t i = 0; i < size;i++)\n\t %s[buffptr[i]] = inbuff[i];"%BUFF_NAME)

        self.do_many_fn = Function("do_many_fn",
            [   "void (*kern_fn)()",
                "uint64_t num_iters",
                "uint64_t * inbufptrs",
                "Float * inbuff",
                "uint64_t insize",
                "uint64_t * outbufptrs",
                "Float * outbuff",
                "uint64_t outsize"],
            """for(uint64_t i = 0; i < num_iters;i++){
                %s
                kern_fn();
                %s
            }"""%(self.in_fn.get_c_call("inbufptrs","&inbuff[i*insize]","insize"),
                  self.out_fn.get_c_call("outbufptrs","&outbuff[i*outsize]","outsize")))

        self.ffi = FFI()
        self.code_inter = None#gets initalized by ffi.dlopen by compile method, using it before then makes no sense

    def get_header(self):
        '''declares types and functions'''
        header = ""

        header += space("typedef","float" if is_32_bit_float else "double",NUMTY,";\n")
        header += space("typedef",BASIC_C_INDEX_TYPE,INDEX_TY,";\n")

        header += self.out_fn.get_declaration()
        header += self.in_fn.get_declaration()
        header += self.init_fn.get_declaration()
        header += self.do_many_fn.get_declaration()

        header += self.mathlib.lib_header

        for kern in self.kernels:
            header += kern.func.get_declaration()

        return header

    def get_body(self):
        body = make_line(space(NUMTY,BUFF_NAME,"[",str(self.buffersize),"]"))
        body += self.out_fn.get_main_code()
        body += self.in_fn.get_main_code()
        body += self.init_fn.get_main_code()
        body += self.do_many_fn.get_main_code()

        body += self.mathlib.lib_code

        for kern in self.kernels:
            body += kern.func.get_main_code()
        return body

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
