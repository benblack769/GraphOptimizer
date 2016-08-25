#pragma once
#include <vector>
#include <string>
#include <utility>

typedef bool (*test_fn)();

//#ifdef RUN_TESTS

bool compcodetest();
bool testtestpass();
bool testtestfail();
bool testtesterror();
bool plat_test();
bool graph_queue_get_test();
bool graph_queue_sort_test();
bool alter_state_test();

class TestObj{
public:
    using test_ty = std::pair<test_fn,std::string>;
    std::vector<test_ty> tests;
    test_fn add_test(test_fn test, std::string func_name){
        tests.emplace_back(test,func_name);
        return test;
    }
    void run_all();
    void fancy_print(std::string func_str);
    inline void collect_tests(){
#define _add_test(test) add_test(test,#test)
#ifdef TESTTEST
        _add_test(testtestpass);
        _add_test(testtestfail);
        _add_test(testtesterror);
#endif
        _add_test(compcodetest);
        _add_test(plat_test);
        _add_test(graph_queue_get_test);
        _add_test(graph_queue_sort_test);
        _add_test(alter_state_test);
#undef _add_test
    }
};

extern TestObj all_tests;
