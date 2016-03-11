import group
import subprocess
import numbers
from shutil import copyfile
from compiler import *
from cffi import FFI
from NumVal import NumVal
import graph
from io import StringIO

def space(*args):
    return " ".join(args)

def make_line(Str):
    return Str + ";\n"
        
def get_marker_cffi_buf(ffi,nodes):
    buf = ffi.new(BASIC_C_INDEX_TYPE+" []",len(nodes))
    for i in range(len(nodes)):
        buf[i] = nodes[i].marker
    return buf

def buffer_at(loc):
    return space(BUFF_NAME,"[",str(loc),"]")

def cffi_fn(cffi_code,fname):
    return eval("cffi_code."+fname)

def file_identical(name1,name2):
    try:
        with open(name1) as f1:
            with open(name2) as f2:
                return f1.readlines() == f2.readlines()
    except:
        return False
def save_file(name,text):
    with open(name,"w") as f1:
        f1.write(text)

class MainBlock:
    def __init__(self,code_start=""):
        self.code = [code_start]
    def add_to_body(self,newcode):
        self.code.append(newcode)
    def get_code(self):
        return "".join(self.code)
    def loop_around(self,loopcode):
        self.code = loopcode + "{" + self.get_code() + "}"

class Function:
    def __init__(self,name,args=[],body_start="",returnty="void"):
        self.name = name
        self.args = args
        self.ret_ty = returnty
        self.mainblock = MainBlock(body_start)
    def add_to_body(self,new_instruction):
        self.mainblock.add_to_body(new_instruction)
    def get_c_call(self,*in_arg_names):
        arg_str = ', '.join(in_arg_names)
        return self.name + "(" + arg_str + ");"
    def get_front(self):
        return space(self.ret_ty,self.name,"(",",".join(self.args),")")
    def get_declaration(self):
        return self.get_front() + ";\n"
    def get_body(self):
        return self.mainblock.get_code()
    def get_main_code(self):
        return self.get_front() + "{\n" + self.get_body() + "}\n"
    def cffi_call(self,cffi_dll,*args):
        cffi_fn(cffi_dll,self.name)(*args)

class Kernel:
    def __init__(self,ffi,init_fn,kern_id,inter_out_nodes,final_out_nodes,inter_in_nodes,new_in_nodes,const_nodes):
        self.in_buffer_locs = get_marker_cffi_buf(ffi,new_in_nodes)
        self.output_buffer_locs = get_marker_cffi_buf(ffi,final_out_nodes)

        self.outputs = [] #list of nparray values

        self.func = Function(KERN_NAME + str(kern_id))

        print_debug(self.func.name + " function ran")
        
        nextnodes = inter_out_nodes + final_out_nodes
        const_set = set(const_nodes)
        all_nodes = set(const_nodes)
        while nextnodes:
            newnext = []
            for n in nextnodes:
                if n not in all_nodes:
                    all_nodes.add(n)
                    if isinstance(n,graph.BinOpNode):
                        newnext.append(n.left)
                        newnext.append(n.right)
                    elif isinstance(n,graph.UnOpNode):
                        newnext.append(n.source)
            nextnodes = newnext

        new_consts = []
        dests = {n:[] for n in all_nodes}
        for n in all_nodes:
            if n in const_set:
                continue
            if isinstance(n,graph.BinOpNode):
                dests[n.left].append(n)
                dests[n.right].append(n)
            elif isinstance(n,graph.UnOpNode):
                dests[n.source].append(n)
            elif isinstance(n,graph.ConstNode):
                new_consts.append(n)

        curnodes = inter_in_nodes + new_in_nodes + const_nodes + new_consts
        depth_sorted_vs = [] 
        completed_nodes = set(curnodes)
        cur_depth = 100000
        while curnodes:
            ncurnodes = []
            repeat_nodes = []
            for n in curnodes:
                for next in dests[n]:
                    if (next not in completed_nodes and
                        (isinstance(next,graph.UnOpNode) or
                        (isinstance(next,graph.BinOpNode) and next.left in completed_nodes and next.right in completed_nodes))):
                            ncurnodes.append(next)
                            completed_nodes.add(next)
            curnodes = ncurnodes
            depth_sorted_vs += ncurnodes

        print_debug(self.func.name + " depth thingy completed")

        '''
        curnodes = inter_out_nodes + final_out_nodes
        all_instructions = dict()
        while curnodes:
            ncurnodes = []
            for n in curnodes:
                if n in const_instrs:
                    continue
                if isinstance(n,graph.ConstNode):
                    init_fn.add_to_body(make_line(space(buffer_at(n.marker),"=",str(n.val))))
                    const_instrs.add(n)
                else:
                    all_instructions[n] = cur_depth

                    if isinstance(n,graph.BinOpNode):
                        ncurnodes.append(n.left)
                        ncurnodes.append(n.right)
                    elif isinstance(n,graph.UnOpNode):
                        ncurnodes.append(n.source)
            curnodes = ncurnodes
            cur_depth -= 1

        print_debug(self.func.name + " depth thingy completed")

        depth_sorted_vs = [NumVal(dep,n) for n,dep in all_instructions.items()]
        depth_sorted_vs.sort()
        
        curnodes = inter_in_nodes + new_in_nodes
        depth_sorted_vs = curnodes
        completed = set(curnodes)
        
        while curnodes:
            newcurs = []
            def add_child(child):

            for n in curnodes:
                if n not in completed:
                    if isinstance(n,graph.BinOpNode):
                    elif isinstance(n,graph.UnOpNode):
                    newcurs.append(n.left)
                    newcurs.append(n.right)
                    completed.add(n)
            curnodes = newcurs
            depth_sorted_vs += newcurs
            
        '''
        for cn in new_consts:
            init_fn.add_to_body(make_line(space(buffer_at(cn.marker),"=",str(cn.val))))
        for node in depth_sorted_vs:
            if isinstance(node,graph.BinOpNode):
                st = make_line(space(buffer_at(node.marker),"=",node.oper.op_code(buffer_at(node.left.marker),buffer_at(node.right.marker))))
            elif isinstance(node,graph.UnOpNode):
                st = make_line(space(buffer_at(node.marker),"=",node.oper.op_code(buffer_at(node.source.marker))))
            elif isinstance(node,graph.ConstNode):
                raise CompileError("runaway const node")
            else:
                raise CompileError("hit bad node type"+str(type(node)))
            self.func.add_to_body(st)
        #finally, assign the inter_out to the inter_in
        for nin,nout in zip(inter_in_nodes,inter_out_nodes):
            self.func.add_to_body(make_line(space(buffer_at(nin.marker),"=",buffer_at(nout.marker))))
            
        print_debug(self.func.name + " body completed")

    def _run(self,cffi_dll,ffi,in_cffi_buff,many_fn,num_iters):
        outsize = len(self.output_buffer_locs) * num_iters
        outb = ffi.new(NUMTY+"[]",outsize)
        fn_thing = cffi_fn(cffi_dll,self.func.name)
        print_debug("call started")
        many_fn.cffi_call(cffi_dll,fn_thing,num_iters
                          ,self.in_buffer_locs,in_cffi_buff,len(self.in_buffer_locs)
                          ,self.output_buffer_locs,outb,len(self.output_buffer_locs))
        print_debug("call finished")
        norm_osize = len(self.output_buffer_locs)
        for j in range(num_iters):
            out_start = j*norm_osize
            self.outputs.append([outb[out_start+i] for i in range(norm_osize)])

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