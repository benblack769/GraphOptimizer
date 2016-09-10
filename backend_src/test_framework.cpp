#include "test.h"
#include <exception>
#include <iostream>

using namespace std;

TestObj all_tests;

void TestObj::run_all(){
    bool has_failed = false;
    //ofstream cout("argname.txt");
    for(test_ty & test : tests){
        cout.clear();
        try{
            cout << test.second << ": " << endl;
            if(test.first()){
                cout << "PASSED" << endl;
            }
            else{
                cout << "FAILED" << endl;
                has_failed = true;
            }
        }
        catch(std::exception & except){
            cout << "EXCEPTION RAISED\n" << except.what() << endl;
            has_failed = true;
        }
        catch(...){
            cout << "threw some weird exception" << endl;
            has_failed = true;
        }
    }
    if(has_failed){
        cout << "\n\nSOME TESTS DID NOT PASS!!!\n" << endl;
    }
    else{
        cout << "\n\nALL TESTS PASSED.\n" << endl;
    }
    //cout.close();
    //system("cat < argname.txt");
    //system("rm argname.txt");
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
