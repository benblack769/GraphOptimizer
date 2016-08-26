TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_CXXFLAGS += -std=c++11
QMAKE_CXXFLAGS -= -fIPC
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O2 -march=native -mtune=native

#includes my awsome header files
win32{
INCLUDEPATH += "../../PythonProjects"
}
unix{
INCLUDEPATH += "../../"
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
    x86/loopization.cpp

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
    x86/dis_op_process.h \
    abs_processes.h

DISTFILES += \
    oldcode.txt \
    oldgraphcode.txt
