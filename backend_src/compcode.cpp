#ifdef _WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#endif
#include <iostream>
#include "utility.h"
#include "compcode.h"
#include "test.h"
using namespace std;

CompCode::CompCode(){

}
CompCode::~CompCode(){
#ifdef _WIN32
    WINBOOL freeworked = FreeLibrary(reinterpret_cast<HMODULE>(handle));
#else
    int freeworked = dlclose(handle);
#endif
    if (freeworked)
        cout << "freeing library failed error code: " << freeworked << endl;
}
CompCode::CompCode(string so_name){
    init(so_name);
}

void CompCode::init(std::string so_name){
#ifdef _WIN32
    handle = LoadLibraryA(so_name.c_str());
#else
    handle = dlopen(so_name.c_str(),RTLD_NOW);
    cout << dlerror() << endl;
#endif
    if(!handle){
        ExitError(so_name + " not loaded");
    }
}
void * CompCode::get_obj(string fnstr){
#ifdef _WIN32
    FARPROC func = GetProcAddress( reinterpret_cast<HMODULE>(handle), fnstr.c_str());

#else
    void * func =  dlsym(handle,fnstr.c_str());
#endif
    if (!func) {
        ExitError("CompCode could not locate the function: " + fnstr);
    }
    return reinterpret_cast<void *>(func);
}


bool compcodetest(){
    string code = "int myfn(int * mega){\
            int m = mega[0];\
            return m * m;\
        }";
    typedef  int(*f_funci)(int *);
    save_file("test.c",code);
    system("gcc -std=c99 -O3 -shared -o test.so -fPIC test.c");
    CompCode ccode("./test.so");
    f_funci fn = reinterpret_cast<f_funci>(ccode.get_obj("myfn"));
    int arg = 12123;
    int argsqr = fn(&arg);
    return argsqr == arg*arg;
}
