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
INCLUDEPATH += "../../myheaders"
LIBS += -ldl
}

SOURCES += main.cpp \
    ref_test.cpp \
    compcode.cpp \
	utility.cpp \
    x86/basicblock.cpp \
    x86/basicloop.cpp \
    c_codegen.cpp \
    x86/basic_kernel.cpp \
    x86/basic_plat.cpp

HEADERS += \
	test.h \
    oper.h \
    compcode.h \
	utility.h \
    graph_backend.h \
    basicblock.h \
    x86/basicblock.h \
    graph_types.h \
    x86/basicloop.h \
    c_codegen.h \
    x86/basic_kernel.h \
    x86/basic_plat.h \
    abstract_block.h

DISTFILES += \
    oldcode.txt
