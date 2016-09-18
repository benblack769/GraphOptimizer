#pragma once
#include <cassert>
#include <vector>
#include <memory>
#include "abs_process.h"
#include "mem_impl.h"
#include "oper.h"

using namespace std;

namespace sequencial{
enum class scalar_ty{UNI,BIN};

class op_holder{
protected:
    scalar_ty stype;
    bin_core _bin;
    uni_core _uni;
public:
    op_holder(bin_core inbin){
        stype = scalar_ty::BIN;
        _bin = inbin;
    }
    op_holder(uni_core inuni){
        stype = scalar_ty::UNI;
        _uni = inuni;
    }
    scalar_ty get_type()const{
        return stype;
    }
    bin_core bin()const{
        assert(stype == scalar_ty::BIN);
        return _bin;
    }
    uni_core uni()const{
        assert(stype == scalar_ty::UNI);
        return _uni;
    }
};
class Scalar:
    public Process{
protected:
    vector<Memory> inputs;
    vector<Memory> outputs;
public:
    op_holder data;
    Scalar(vector<Memory> ins,vector<Memory> outs,op_holder indata):
        inputs(ins),
        outputs(outs),
        data(indata){
        assert(indata.get_type() == scalar_ty::UNI || indata.get_type() == scalar_ty::BIN);
    }
    bool stats_same(const Process & other)const{
        if(typeid(Scalar) != typeid(other)){
            return false;
        }
        const Scalar & other_s = *reinterpret_cast<const Scalar *>(&other);
        if(other_s.data.get_type() != data.get_type()){
            return false;
        }
        /*cout.clear();
        if(data.get_type() == scalar_ty::BIN){
            cout << "mybin = " << static_cast<int>(data.bin()) << endl;
            cout << "obin = " << static_cast<int>(other_s.data.bin()) << endl;
        }*/
        switch(data.get_type()){
        case scalar_ty::BIN: return data.bin() == other_s.data.bin();
        case scalar_ty::UNI: return data.uni() == other_s.data.uni();
        default: assert(false && "bad case value");
        }
    }
    vector<Memory *> mems(){
        vector<Memory *> res;
        for(Memory & mem : inputs) res.push_back(&mem);
        for(Memory & mem : outputs) res.push_back(&mem);
        return res;
    }
    string to_string(){
        string source;
        switch(data.get_type()){
        case scalar_ty::BIN:
            assert(inputs.size() == 2);
            source =  bin_str(inputs[0].to_string(),inputs[1].to_string(),data.bin());
            break;
        case scalar_ty::UNI:
            assert(inputs.size() == 1);
            source =  uni_str(inputs[0].to_string(),data.uni());
            break;
        default: assert(false && "bad case value");
        }
        assert(outputs.size() == 1);
        return assign_str(outputs[0].to_string(),source);
    }
    unique_ptr<Process> clone(){
        return unique_ptr<Process>(new Scalar(*this));
    }
};
}
