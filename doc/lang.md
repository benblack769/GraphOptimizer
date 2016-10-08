# Description of memory managed language

### Primary restriction

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

### language data types

#### Parameters

Parameters represent the location and size of various chunks of memory. No memory is not described by a parameter. Parameters cannot be stored in the data they are describing (they can be converted into values or index though, and then stored).

#### Indexes

Indexes are what they sound like, they reference a point in memory. They are an offset of a parameter. Each index refers to a unique parameter.

A notable feature is that they really have to be guaranteed to be in the bounds of the size that their parameter describes. This means runtime checking (you will be able to turn this off optionally). Also, all arithmetic on them will have to be constrained in some way as to never exceed the parameter size. This will help avoid segfaults. Note that while in C, this would be excessively restrictive, the fact that we are already separating values from indexes and parameters in order to perform the key operations makes it an additional burden.

Details on index arithmetic: (comming soon)

#### Values

Raw data. Cannot be used to index other data. Basic arithmetic operations only.

### language control flow.

#### Loop

#### Conditional
