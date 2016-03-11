#ifdef _WIN32
#include <windows.h>
constexpr bool is_windows = true;
#else
#include <dlfcn.h>
constexpr bool is_windows = false;
#endif
#include <iostream>
#include "utility.h"
#include "compcode.h"
using namespace std;

CompCode::CompCode(){

}
CompCode::~CompCode(){
#ifdef _WIN32
    WINBOOL freeworked = FreeLibrary(reinterpret_cast<HMODULE>(handle));
#else
    int freeworked = dlclose(handle);
#endif
    if (!freeworked)
        cout << "freeing library failed\n";
}
CompCode::CompCode(string so_name){
    init(so_name);
}

void CompCode::init(std::string so_name){
#ifdef _WIN32
    handle = LoadLibrary(wstring(so_name.begin(),so_name.end()).c_str());
#else
    handle = dlopen(so_name.c_str(),RTLD_NOW);
    cout << dlerror() << endl;
#endif
    if(!handle){
        ExitError(so_name + " not loaded");
    }
}
void * CompCode::get_fn(string fnstr){
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
