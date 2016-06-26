#pragma once
#include <vector>
#include <string>
#include <utility>

typedef bool (*test_fn)();

#ifdef RUN_TESTS
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
};

extern TestObj all_tests;
#define TEST(test_name) \
    bool test_name();/*declares test*/ \
    test_fn __##test_name##__wrapper = all_tests.add_test(test_name, #test_name );/*adds test to execute list*/ \
    bool test_name()/*sets up test to actually be created by code as if it were a normal function*/

#else
//if not running tests then it is just a normal function
#define TEST(test_name) bool test_name()
#endif
