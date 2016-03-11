import subprocess
from cffi import FFI

code = '''
int myfn(int * mega){
    int m = mega[0];
    return m * m;
}
'''
with open("ccode.c",mode="w") as file:
    file.writelines([code])

subprocess.call(["gcc","-std=c99","-O3","-shared", "-o", "libccode.so", "-fPIC","ccode.c"])

inter = FFI()
inter.cdef("int myfn(int *  mega);")
compiled_code = inter.dlopen("libccode.so")
args = inter.new("int[]", 800)
args[0] = 50
res = compiled_code.myfn(args)
print(res)