#include "test.h"
#include <exception>
#include <iostream>

using namespace std;

TestObj all_tests;

void TestObj::run_all(){
    bool has_failed = false;
    for(test_ty & test : tests){
        try{
            fancy_print(test.second);
            if(test.first()){
                cout << "PASSED\n";
            }
            else if(test.first()){
                cout << "FAILED\n";
                has_failed = true;
            }
        }
        catch(std::exception & except){
            cout << except.what() << endl;
            has_failed = true;
        }
        catch(...){
            cout << "threw some weird exception" << endl;
            has_failed = true;
        }
    }
    if(has_failed){
        cout << "\n\nSOME TESTS DID NOT PASS!!!\n\n";
    }
    else{
        cout << "\n\nALL TESTS PASSED.\n\n";
    }
}
void TestObj::fancy_print(std::string func_str){
    cout << func_str << ": " << endl;
}
