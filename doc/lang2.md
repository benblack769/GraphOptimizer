# Building on ideas from lang

Core idea: Optimizations happen in libraries, not in compiler.

Language is there to allows libraries to easily transform code into more efficient code,
not as a static cpu-only system like c++ templates, or a weird introspection/code generation system like rpython,
but as a native feature, that appears much like object oriented code.

## Low level heterogeneous computing code symbols

How does one have both low level and truly heterogeneous symbols? (answer, you don't, OpenCL tried this and failed because different processors have different features, and need different tuning to achive maximum performance).

Instead, going back to the idea that optimizations happen in libraries, not the compiler, low level symbols are hardware dependent. Libraries will support many different hardware platforms, and can define new high level symbols that get compiled to the low level symbols. Of course, if there is a hardware platform that one wants to use, but cannot because your library doesn't support your hardware, you are out of luck, but it should be much easier to change that library than an entire compiler.

### Example transformation from medium to low level code

Take the matrix multiplication powers by squaring example from before.
