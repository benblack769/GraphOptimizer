#pragma once
#include <vector>
#include <cstdint>
#include <cassert>

using namespace std;
namespace sequencial{
enum buf_ty{OUTPUT,STORED,INPUT,INTERNAL,CONSTANT};
struct Memory{
    size_t offset;
    buf_ty type;
};

enum scalar_ty{ADD,MUL,SUB,DIV,EXP,NEG};
enum proc_ty{SCALAR,LOOP};

struct Scalar;
struct Loop;
class Process{
protected:
    proc_ty type;
    void * data;
public:
    Process(const Scalar & sca);
    Process(const Loop & loop);
    Process(const Process & proc){
        *this = proc;
    }
    Process & operator = (const Process & proc);
    
    proc_ty get_type(){
        return type;
    }
    const Scalar & scalar()const{
        assert(type == SCALAR);
        return *static_cast<Scalar *>(data);
    }
    const Loop & loop()const{
        assert(type == LOOP);
        return *static_cast<Loop *>(data);
    }
};

struct code_item{
    vector<Memory> inputs;
    vector<Memory> outputs;
    Process proc;
};
using code_sequ = vector<code_item>;
struct Scalar{
    scalar_ty type;
};
struct Loop{
    code_sequ sequ;
    size_t begin;
    size_t end;
    int64_t inc;
};
inline Process::Process(const Scalar & sca):
    type(SCALAR),
    data(new Scalar(sca)){}

inline Process::Process(const Loop & loop):
    type(LOOP),
    data(new Loop(loop)){}

inline Process & Process::operator = (const Process & proc){
    type = proc.type;
    switch (type) {
    case LOOP:  data = new Loop(proc.loop());break;
    case SCALAR:data = new Scalar(proc.scalar());break;        
    }
    return *this;
}
}
