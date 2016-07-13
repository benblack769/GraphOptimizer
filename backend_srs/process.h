#pragma once
#include <vector>
#include <string>
#include "graph_types.h"

using namespace std;

class process{
public:    
    virtual ~process() = default;
    
    //corresponds to the time it takes to execute
    //todo: make this more sophisticated with resource useage statistics
    //virtual double cost() = 0;
    
    //allows process_generator to uniqueify processes
    virtual bool is_equal(process * proc) = 0;
    virtual size_t hash_val() = 0;
    
    // generates a function that calculates the value from array inputs
    // function has language agnostic interface
    //
    // void calc##unique_id(input_array,output_array)
    //
    virtual string declaration(uint64_t unique_id) = 0;
    virtual string usage(uint64_t unique_id,const vector<string> & args) = 0;
    
    //helper functions
    void register_output(process * user){
        dests.push_back(user);
    }
};
