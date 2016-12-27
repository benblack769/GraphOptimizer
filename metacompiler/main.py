import numbers
import subprocess
from cffi import FFI
import numpy as np
import ctypes
import itertools

class ImpementationRequired(Exception):
    def __str__(self):
        return "Implementation for called function is required in class"

class Platform:
    def __init__(self,name):
        self.name = name #this is a distinct name that is used for differenciating files of different platforms
        self.graph = []

    def compile(self):
        pass

class BaseExpression:
    def __init__(self):
        pass

class ConstArith:
    '''
    performs the operation f (idx) -> (offset + idx * multiplier)/divider
    '''
    def __init__(self,offset,multiplier,divider):
        pass

class Integer:
    def __init__(self,ars):
        pass
    def type_def(self):
        return "int"

class BaseOp:
    def arg_str(self):
        '''string for declaration interface in function'''
    def init_str(self):
        '''is placed at beginning of kernel'''
        return ""
    def access_str(self):
        '''is placed when operation is used. If it is a function, this is the function useage'''
        return ""
    def global_str(self):
        '''is placed at top of file. '''
        return ""
    def unique_descendents(self):
        return set(itertools.chain.from_iterable(self.children))

class InOutBuff(BaseOp):
    def __init__(self,name,size,mytype):
        self.name = name
        self.size = size
        self.type = mytype

    def arg_str(self):
        return self.type.type_def() + " * " + self.name
    def access_str(self):
        return self.name

class Oper(BaseOp):
    def __init__(self,gtext):
        self.gen_text = gtext
    def access_str(self):
        return self.gen_text

Add = Oper("+")
Mul = Oper("*")
Sub = Oper("-")
Div = Oper("/")

Neg = Oper("-")

class FuncOp(BaseOp):
    def __init__(self,func,*args):
        self.children = args
        self.oper = oper
    def access_str(self):
        return "({} ({}))".format(self.oper.access_str(),", ".join(child.access_str() for child in self.children))

class UniOp(FuncOp):
    def __init__(self,oper,arg):
        Func.__init__(self,oper,arg)

class BinOp(BaseOp):
    def __init__(self,oper,arg1,arg2):
        self.arg1 = arg1
        self.arg2 = arg2
        self.children = [self.arg1,self.arg2]
        self.oper = oper
    def access_str(self):
        return "(({}) {} ({}))".format(self.arg1.access_str(),self.oper.access_str(),self.arg2.access_str())

class FuncDecl(BaseOp):
    def __init__(self,name,rettype,funcblocks=None):
        self.name = name
        self.rettype = rettype
        self.children = kernblocks if kernblocks != None else []
    def add_block(self,block):
        self.children.append(block)
    def global_str(self):
        args = [child.arg_str() for child in children if child.arg_str()]
        bodystrs = [child.access_str() for child in children if child.access_str()]
        gstr = "{retty} {name} ({args}) {{\n {body} }}".format(retty=self.rettype,name=self.name,args=", ".join(args),body="\n".join(bodystrs))

class File(BaseOp):
    def __init__(self,name,kerns=None):
        self.children = kerns if kerns != None else []
    def gen_str(self):
        "\n".join(desc.global_str() for desc in self.unique_descendents())
