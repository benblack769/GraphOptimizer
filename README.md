# GraphOptimizer
A multipurpose optimizer for scientific calculations.

## Build

You need gcc for this to work correctly (mingw on windows). On osx, clang named "gcc" name should work just fine. If you need to customize the compiler, change the compiler in `backend_src/basic/basic_plat.cpp`.

In order to use the python frontend, you need a 64 bit python (version 3) with the numpy and cffi packages installed.

Use cmake to build the c++ files.

On linux this:

    cmake .
    make

On windows using mingw (in command prompt or PowerShell, not MSYS or anything)

    cmake . -G  "MinGW Makefiles"
    mingw32-make

## Test

Run

    backend_bin/test

To run the c++ unit tests. It will print out a bunch of garbage, and then if it says "ALL TESTS PASSED", then everything was fine.

You can run the python integration test with

    python refrence_test.py

You can run the full ANN implementation on the MNIST handwriting dataset with

    python main.py

It will print out a whole bunch of timing and debugging information before
printing something like  

    In epoc:  0
    Guessed  92.72 % correctly

If it around that percentage, then everything is working correctly.
I say that with a high degree of confidence because main.py uses almost every single feature available.

## Current status(personal research project)

#### Notice:

The code is organized for maximum flexibility, and development speed for myself, not ease of contributions or serious usage as a library. However, with some minor refactoring, it should be easily convertible to a reasonable library.

### Python frontend

The python interface, although not particularly robust, has been carefully crafted for maximum exposure to the underlying implementation for maximum runtime performance, while also being as usable and clean as possible. It is not optimized for startup/compile time speed.

Inputs and outputs are numpy arrays, minimizing the copy overhead.

### C++ Backend (with C interface)

The experimentation happens here, so this may not be up to date.

#### Algorithm

Forms a full graph of the specific operations (addition, multiplication, exponentiation, etc) described by the kernel. Does not describe loops or branches, so all kernels must be branchless. This allows for a much simpler and easier to optimize runtime model.

The runtime model closely follows the c model, where temporary variables are stored in a stack. The difference being that the stack is of a fixed size (like Fortran 77), since there are no branches in the kernel.

Optimizations:

1. Dead code elimination
2. Efficient memory usage
    1. Reuses stale memory.
    2. Gives O(n^2) memory usage on the matrix multiplication test instead of O(n^3), and decreases memory useage by a 5th on the ANN test.
3. Re-looping the graph
    1. Allows for efficient compilation of larger programs.
    2. Is not perfect, in that there is reasonable code which unfortunately does not loop.

## End purpose

A quality optimizer for neural network code. Specifically, it support this model of computation:

A kernel, which has input and output, which is read through once per run, and an internal state, which is updated over many runs over the kernel.

A platform, which contains many kernels. The internal state is shared between kernels on the same platform. The internal state can be accessed at any time after compilation.

Before any data is acted upon, the kernels have to be described and then compiled.

This model works extremely well for code that works generally like this psuedocode:

    intermediate_data = rand_array()
    for i in range(data_size):
        output[i],intermediate_data = no_branches_calc(input[i],intermediate_data)

So anything that looks like this for sufficiently large data_size should work to some degree, although it works very best with code with very few conditionals. Nontrivial data structures like hash tables, heaps or binary search trees will especially not benefit from this framework, and if the bottleneck in your program surrounds these, then I do not recommend this project.

Commenting on this model, this is really built to support neural network development. Performance regression testing will be on ANN implementations. So anything other than ANNs that work well on this optimizer is purely coincidental at this point. However, although it is not my top priority, I really hope that this product will be more general than that, and so if you find some other problems for which this works especially well, please contact me about including it in the performance regression testing.

### Specific stretch goals

* Should generate fully scalable code, generating multi-threaded, gpu, cluster computing and multi-gpu code (in that order of importance).
* Optimization should take no longer than O(N*log(N)) asymptotic time, where N is the computation time for a single run. Should also be reasonably fast, and preferably be multi-threaded.
* Make new backends relatively easy to implement. A contributor should not have to have a deep understanding of the core algorithms to add a backend.
* Support frontends for the most common scientific computation languages, including python and c++. Make frontends easy to add for new languages.

### Things it will absolutely not do:

* Approximate anything: you should get the same answer every time.
* Have any knowledge about values of numeric inputs, except for constants, loop and array parameters (optimizations including these tend to work the same on all hardware, and aren't that gross so can be safely ignored).

## Contact

If you wish to contribute, or are interested in learning more, feel free to contact me at weepingwilloben@gmail.com.
