SRC="backend_srs"
g++ -std=c++11 -O2 -shared -o cpp_code.so -fPIC -I "../myheaders" -I $SRC"/x86" -I $SRC $SRC/c_codegen.cpp $SRC/x86/basic_plat.cpp $SRC/x86/basic_kernel.cpp $SRC/compcode.cpp $SRC/utility.cpp
