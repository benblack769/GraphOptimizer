#include "test.h"
#include <exception>
#include <fstream>

using namespace std;

TestObj all_tests;

void TestObj::run_all(){
    bool has_failed = false;
    ofstream fcout("argname.txt");
    for(test_ty & test : tests){
        try{
            fcout << test.second << ": " << endl;
            if(test.first()){
                fcout << "PASSED" << endl;
            }
            else{
                fcout << "FAILED" << endl;
                has_failed = true;
            }
        }
        catch(std::exception & except){
            fcout << "EXCEPTION RAISED\n" << except.what() << endl;
            has_failed = true;
        }
        catch(...){
            fcout << "threw some weird exception" << endl;
            has_failed = true;
        }
    }
    if(has_failed){
        fcout << "\n\nSOME TESTS DID NOT PASS!!!\n" << endl;
    }
    else{
        fcout << "\n\nALL TESTS PASSED.\n" << endl;
    }
    fcout.close();
    system("cat < argname.txt");
    system("rm argname.txt");
}
bool testtestpass(){
    return true;
}

bool testtestfail(){
    return false;
}

bool testtesterror(){
    throw runtime_error("testtesterror raised error as expected");
}
