#pragma once
#include "basic_kernel.h"


class disopt_kern:
        public basic_kernel
{
public:
    disopt_kern() = default;
    void optimize();
};
