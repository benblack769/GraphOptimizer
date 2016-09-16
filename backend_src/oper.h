#pragma once
#include <cstdint>
class Node;
constexpr int num_bin = 4;
enum class bin_core{ADD,DIV,MUL,SUB};

constexpr int num_uni = 3;
enum class uni_core{NEG,EXP,ASSIGN};
