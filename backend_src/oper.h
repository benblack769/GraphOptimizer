#pragma once
#include <cstdint>
class Node;
constexpr int num_bin = 4;
enum class bin_core{ADD,DIV,MUL,SUB};

constexpr int num_uni = 3;
enum class uni_core{NEG,EXP,ASSIGN};

constexpr int num_val_types = 2;
enum class val_type{INT,FLOAT};

inline bool is_valid_op(val_type val_ty,uni_core uni){
    switch(uni){
    case uni_core::NEG:
    case uni_core::ASSIGN:
        return true;
    case uni_core::EXP:
        return val_ty == val_type::FLOAT;
    }
}
inline bool is_valid_op(val_type , bin_core ){
    return true;
}
/*
Integer type
Conditional type w/ boolean value
*/
