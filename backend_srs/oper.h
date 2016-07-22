#pragma once
#include <cstdint>
class Node;
namespace op{
constexpr int num_bin = 4;
constexpr int num_uni = 1;
enum bin_core{ADD,DIV,MUL,SUB};
enum uni_core{NEG};
}
