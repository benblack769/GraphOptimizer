#include <windows.h>
#include <string>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include "utility.h"
using namespace std;
string code = "int myfn(int * mega){\
        int m = mega[0];\
        return m * m;\
    }";
typedef  int(*f_funci)(int *);
void test(){
    save_file("test.c",code);
    system("gcc -std=c99 -O3 -shared -o test.dll -fPIC test.c");
    HINSTANCE hGetProcIDDLL = LoadLibrary(L"./test.dll");
    if (!hGetProcIDDLL) {
    std::cout << "could not load the dynamic library" << std::endl;
    exit(EXIT_FAILURE);
  }

  // resolve function address here
  f_funci funci = reinterpret_cast<f_funci>(GetProcAddress(hGetProcIDDLL, "myfn"));
  if (!funci) {
    std::cout << "could not locate the function" << std::endl;
    exit(EXIT_FAILURE);
  }
int x = 10;
  std::cout << "funci() returned " << funci(&x) << std::endl;
}
