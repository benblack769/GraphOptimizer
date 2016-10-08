TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_CXXFLAGS += -std=c++11 
QMAKE_CXXFLAGS -= -fIPC
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O2 -march=native -mtune=native

#includes my awsome header files
INCLUDEPATH += "../../"
unix{
LIBS += -ldl
}
DEFINES += RUN_TESTS

SOURCES += main.cpp \
    compcode.cpp \
	utility.cpp \
    c_codegen.cpp \
    basic/basic_kernel.cpp \
    basic/basic_plat.cpp \
    x86/disopt_kern.cpp \
    test_framework.cpp \
    sub_graph.cpp \
    plat_test.cpp \
    graph_pqueue_test.cpp \
    x86/loopization.cpp \
    cpp_interface/test.cpp \
    basic/concatenize.cpp

HEADERS += \
	test.h \
    oper.h \
    compcode.h \
	utility.h \
    graph_backend.h \
    basicblock.h \
    graph_types.h \
    c_codegen.h \
    basic/basic_kernel.h \
    basic/basic_plat.h \
    x86/disopt_kern.h \
    sub_graph.h \
    basic/basic_names.h \
    graph_pqueue.h \
    abs_processes.h \
    cpp_interface/group.h \
    cpp_interface/platform.h \
    x86/mem_impl.h \
    x86/abs_process.h \
    x86/scalar_proc.h \
    x86/loop_proc.h

DISTFILES += \
    oldcode.txt \
    oldgraphcode.txt
