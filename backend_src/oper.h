#pragma once
#include <cstdint>
class Node;
namespace op{

constexpr int num_bin = 4;
enum bin_core{ADD,DIV,MUL,SUB};

constexpr int num_uni = 3;
enum uni_core{NEG,EXP,ASSIGN};

}
