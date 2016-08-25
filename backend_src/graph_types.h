#pragma once
#include <cstdint>
#include <cstdlib>
#include <vector>
#include "oper.h"
using mark_ty = size_t;
using index_ty = size_t;
using marker_g = std::vector<mark_ty>;
static constexpr mark_ty nilmark = ~0ULL;
