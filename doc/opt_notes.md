# Optimization notes

## CPU

There are several main kinds of higher level optimizations I can think of in a CPU memory system.:

1. Temporal Memory locality
2. Spacial Memory locality/vectorization
3. Code locality/small loops
4. Caching results.
5. Doing less due to prior knowledge of inputs
6. Multi-threading/temporal locality across threads
7. Branch prediction/putting most likely branch first

Comments on all of these

### Temporal Memory locality

Pretty easy to accomplish with a stack of newly used, but empty memory, if accesses are known in advance. Algorithm discussed in locality.md. If not... then I don't know.

### Spacial Memory locality/vectorization

Construct vector paths in the code. Size of vectors in execution should be configurable.

### Doing less due to prior knowledge of inputs

This pretty much always works the same across all kinds of standard hardware, so it can be safely ignored by my optimizer, as the programmer can always just hard code it.

### Multi-threading

Really the same algorithm as Temporal Memory locality 

## GPU

I am not an expert in this, but in GPUs, I know there is also the following things to worry about

6. Utilize local memory when appropriate
7. Minimize bank conflicts
8. Distributing threads efficiently across compute units
9. Minimizing kernel calls and memory synchronizations
10. Minimizing buffer copies between gpu-cpu.

## Multi-processor

Important for this project, but I don't have any clear ideas here. ???? 