g++ -std=c++11 -O2 -shared -o cpp_code.so -fPIC c_codegen.cpp x86/basic_plat.cpp x86/basic_kernel.cpp compcode.cpp utility.cpp
mv cpp_code.so ../cpp_code.so
