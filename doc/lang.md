# Description of memory managed language

## Primary restriction

The location of the data cannot depend of the value of the data itself.

An example of something where this is the case is an array.

An example where this is the case is a heap. In a heap, the data can be in any number of locations based on what it is and what order it gets added to the heap. This makes it quite pathelogical when trying to automate the location of the data because nothing intelligent can be reasoned about it at build time (or really at any time).

Other examples include:

* Binary search trees
* Heaps
* Hash tables
* C-strings
* Just about any sort of non-trivial data structure.

This is not a problem, though, because the sorts of memory optimizations that we are trying to automate have not really been applied to most of these data structures anyways, so it is not actually a problem at all.

C-strings will need to be converted into a nicely parameterized (defined in the data types section) before it can be optimized by this model.

Notable examples of non-trivial data structures which can be reasoned about, and potentially greatly improved over generic implementations:

* Graphs (adjacency lists)
* sparse matrices
* resizable multi-dimensional arrays

## Language data types

#### Parameters

Parameters represent the location and size of various chunks of memory. No memory is not described by a parameter. Parameters cannot be stored in the data they are describing (they can be converted into values or index though, and then stored).

Non-constant parameters(coming soon).

#### Indexes

Indexes are what they sound like, they reference a point in memory. They are an offset of a specific (unique) parameter. Indexes cannot be stored in the parameter they offset.

A notable feature is that they really have to be guaranteed to be in the bounds of the size that their parameter describes. This means runtime checking (you will be able to turn this off optionally). Also, all arithmetic on them will have to be constrained in some way as to never exceed the parameter size. This will help avoid segfaults. Note that while in C, this would be excessively restrictive, the fact that we are already separating values from indexes and parameters in order to perform the key operations makes it an additional burden.
NOTE: There will be no stateful changes of indices within loops. So the only way one can iterate over an arbitrary number of indices is through for loops.

Details on index arithmetic: (coming soon)

#### Values

Raw data. Cannot be used to index other data. Basic arithmetic operations only. Parameters and indices can be converted to values, but not the reverse.

## language control flow.

#### Infinite Loop

Will have break statements. All such loops are probably highly sequential, and so will have no special optimizations.

#### For Loop

For loops will loop over arbitrary numbers of indices. The range that ends first will terminate the loop. In python they would look like:

    for i1,i2,i3 in zip(range(start1,end1,const1),range(start2,end2,const2),range(start3,end3,const3))

For loops will have break statements, but these are just a flag for the optimizer and may be ignored.

Future goals:

* Only having indexes increase by constants may be overly restrictive. Look into having other values there.

#### Conditional

What it sounds like.

Optional parameter that gives the likelihood of taking that path. Defaults to 0.5

#### Example psedocode which follows the design pattern (matrix multiplication)

Based on python syntax

    def mat_mul(matarr1,matarr2):#arguments are the symbolic arrays
        matsize = matarr1.parameter

        matres = zero_data(matsize)

        len = matsize.begin() + size
        for x in range(0,len):
            for y in range(0,len):
                for z in range(0,len):
                    matres[y*len+x] += matarr1[y*len+z] * matarr2[z*len+x]
        return matres

    def identity(size,matsize):
        mat = data(matsize)
        for x in range(0,size):
            mat[x*size+x] = 1
        return mat

    def make_mat_pow():
        size = input_parameter(name="size",optimize_sizes=[4,256,1024])

        matsize = parameter(size*size)
        matarr = input_data(name="data",matsize)

        exp = input_value(name="exponent",type="uint")

        result = identity(size,matsize)
        base = matarr
        Loop:
            if exp == 0:
                break
            if exp % 2 == 0:
                base = mat_mul(base,base)
                exp /= 2
            else:
                result = mat_mul(result,base)
                exp -= 1

        kern = build_kernel(outputs=[result])
        print(kern.inputs)# should print "size, matarr, exponent"
        return kern

    mat_pow_fn = make_mat_pow()
    def mat_pow(mat_data,exponent):#inputs are native language matricies (such as a numpy matrix)
        return mat_pow_fn(size=mat_data.d1_size(),data=mat_data,exponent=exponent)



## Internal Intermediate Representation

Each syntactic operation will point to all of the conditionals and ranges that affect the end result of the value.

So basically, given any expression, you can find all of the conditionals and data dependencies fairly easily.

## Random notes on design

Turning this into a fully parsed language seems a poor idea. The whole reason one used a nice, modern language is to be able to produce large, very flexible, powerful code. This is not built for large, or flexible code. Instead, this should just be an acceleration framework which houses key high performance functionality. Instead of creating a shitty, hard to work in language, and making a finiky ffi to communicate with other languages, or go through all the work involved in making language extensions, why not just make a code generation library which compiles at startup time? (like opencl) Perhaps adding an extension which allows it to compile at install time (like ATLAS). While this might be very finiky and annoying, and amazingly bad syntax, with sufficiently powerful languages, I think this can be done reasonably. And just about all HPC happens in extraordinarily powerful languages like python, matlab, c++ and the like. And if it can, then why not? Especially at first, this should be much easier to implement.

Then, if someone wants, they should be able to make an XML implementation fairly easily, if they wish.

## Algorithms

### Assessing data dependencies, parallelism

Because of the way for loops are constructed, we can find data dependencies on all data simply due to the form of the expression, and indeed if only part of an expression is dependent on the other, then they can be split into dependent and independent forms.

For example, take the matrix multiplication example.

    for x in range(0,len):
        for y in range(0,len):
            for z in range(0,len):
                matres[y*len+x] += matarr1[y*len+z] * matarr2[z*len+x]

There is a single array representing the matrix, which is evaluated in a single expression. However, the output is only dependent on certain rows and columns of the source matrices, as well as its own value, not the value of the whole thing.

Then you can easily compute the structure of the dependencies for any output.

Then for dense operations, you can group the computations into mapreduce/broadcast chunks and optimize it under the polynomial model.

#### Multi stage computation

Example: computing dense determinant.
