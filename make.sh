SRC="backend_srs"
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    MYHEADERS="../myheaders"
else
    MYHEADERS="../Visual Studio 2013/"
fi

g++ -std=c++11 -O2 -shared -o cpp_code.so -fPIC -I "$MYHEADERS" -I $SRC"/x86" -I $SRC $SRC/c_codegen.cpp $SRC/x86/basic_plat.cpp $SRC/x86/basic_kernel.cpp $SRC/compcode.cpp $SRC/utility.cpp
