cmake_minimum_required (VERSION 2.8)
project (GraphOptimizer C CXX)

set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/backend_bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

set(CPP_SOURCE_DIR ${PROJECT_SOURCE_DIR}/backend_src)

include_directories("${CPP_SOURCE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/..")

LINK_DIRECTORIES(${CMAKE_BINARY_DIR}/res)

add_library(main SHARED ${CPP_SOURCE_DIR}/c_codegen.cpp ${CPP_SOURCE_DIR}/basic/basic_plat.cpp ${CPP_SOURCE_DIR}/basic/basic_kernel.cpp ${CPP_SOURCE_DIR}/x86/disopt_kern.cpp ${CPP_SOURCE_DIR}/x86/loopization.cpp ${CPP_SOURCE_DIR}/compcode.cpp ${CPP_SOURCE_DIR}/utility.cpp)
add_executable(test ${CPP_SOURCE_DIR}/plat_test.cpp ${CPP_SOURCE_DIR}/graph_pqueue_test.cpp  ${CPP_SOURCE_DIR}/test_framework.cpp ${CPP_SOURCE_DIR}/main.cpp ${CPP_SOURCE_DIR}/cpp_interface/test.cpp)

set_property(TARGET test PROPERTY CXX_STANDARD 11)
set_property(TARGET test PROPERTY CXX_STANDARD_REQUIRED ON)

set_property(TARGET main PROPERTY CXX_STANDARD 11)
set_property(TARGET main PROPERTY CXX_STANDARD_REQUIRED ON)

set_property(TARGET main PROPERTY INTERPROCEDURAL_OPTIMIZATION True)#check if this actually works

IF (WIN32)
ELSE()
    target_link_libraries(main -ldl)
ENDIF()

target_link_libraries(test main)
