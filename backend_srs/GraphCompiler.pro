TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_CXXFLAGS += -std=c++11 -shared -FIPC
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3 -march=native -mtune=native

#includes my awsome header files
win32{
INCLUDEPATH += "../../Visual Studio 2013"
}
unix{
INCLUDEPATH += "../../rand_projs"
LIBS += -ldl
}
DEFINES += RUN_TESTS

SOURCES += main.cpp \
    ref_test.cpp \
    compcode.cpp \
	utility.cpp \
    c_codegen.cpp \
    basic/basic_kernel.cpp \
    basic/basic_plat.cpp \
    x86/disopt_kern.cpp \
    test_framework.cpp \
    sub_graph.cpp

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
    abstract_block.h \
    x86/disopt_kern.h \
    sub_graph.h \
    process.h \
    process_maker.h \
    basic/basic_processes.h \
    basic/basic_names.h

DISTFILES += \
    oldcode.txt \
    oldgraphcode.txt
