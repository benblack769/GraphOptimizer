# GraphOptimizer
A multipurpose optimizer for scientific calculations.

## End purpose

A quality optimizer for neural network code. Specifically, it support this model of computation:

A kernel, which has input and output, which is read through once per run, and an internal state, which is updated over many runs over the kernel.

A platform, which contains many kernels. The internal state is shared between kernels on the same platform. The internal state can be accessed at any time after compilation.

Before any data is acted upon, the kernels have to be described and then compiled.

This model works extremely well for code that works generally like this psuedocode:

    intermediate_data = rand_array()
    for i in range(data_size):
        output[i],intermediate_data = calc(input[i],intermediate_data)

So anything that looks like this for sufficiently large data_size should work to some degree, although it works very best with code with very few conditionals.

Commenting on this model, this is really built to support neural network development. Performance regression testing will be on ANN implementations. There will be tricks and options that make certain optimizations (like batching) very easy and natural. So anything other than ANNs that work well on this optimizer is purely coincidental at this point. However, although it is not my top priority, I really hope that this product will be more general than that, and so if you find some other problems for which this works especially well, please contact me about including it in the performance regression testing.

### Specific stretch goals

* Should generate fully scalable code, generating multi-threaded, gpu, cluster computing and multi-gpu code (in that order of importance).
* Optimization should take no longer than O(N*log(N)) asymptotic time, where N is the computation time for a single run. Should also be reasonably fast, and preferably be multi-threaded.
* Make new backends relatively easy to implement. A contributor should not have to have a deep understanding of the core algorithms to add a backend.
* Support frontends for the most common scientific computation languages, including python and c++. Make frontends easy to add for new languages.

## Current status(personal research project)

#### Notice:

The code is organized for maximum flexibility, and development speed for myself, not ease of contributions or serious usage as a library. However, with some minor refactoring, it should be easily convertible to a reasonable project.

### Python frontend

The python interface, although not robust, has been carefully crafted for maximum exposure to the underlying implementation for maximum performance, while also being as usable and clean as possible.

Inputs and outputs are lists, making the memory and copy overhead completely unbearable.

### C++ Backend (with C interface)

Currently does no more than a full loop unroll of the entire kernel, which is hideously slow. Better implementation coming soon.

## Contact

If you wish to contribute, or are interested in learning more, please contact me at weepingwilloben@gmail.com.
