# Language design notes:

### Approach 1 (object orientation)

Basically, allow for overriding/extending of arbitrary methods inside the objects that describe and form the code.

That pretty much means using an established language( e.g. python). This means creating a functional string of symbols that describe the program. Which unfortunately means a really freakishly ugly syntax. This method means much easier library creation for substantially worse algorithm creation. But still not really all that much worse than the competition.

### Approach 2 (TeX style language)

Define macros in code which define generation.

Potentially much simpler, but also less powerful in terms of introspection, and less useful.

Need to define an FFI.

Yeah, ok, lets go with object orientation.

## Object interfaces

Type of objects

1. Blocks (Nested blocks, allows introspection on use)
2. Operators/functions (describes properties and code generations for various platforms)
3. Data storage vectors (describes how memory is stored)
4. Platforms (descriptions of type of code generated)

Going down the purposes of these in detail,

### Platforms

Define how to compile the collected code. Other objects see this as a sort of marker for which code to generate, nothing more (e.g. this does not produce code, nor does other code call any methods).

### Blocks

Should allow for at minimum: for, "parallel for", while, if, parallel blocks (as in tensorflow). Introspection should be easy and intuitive. Consider looking at LLVM AST for inspiration here.

### Operators/functions

Low level code operations. Should be exceptionally easy to pattern match and manipulate. Should define the number of operations, and for binary operations, should define things like associativity and commutativity properties.

### Data storage vectors

Really the hardest part here. I want to keep things as pure functional as possible to increase optimization possibilities, but that doesn't really open up nice possibilities for programming models. So one option is a combination of a functional expression model, a c-like temporary storage model, followed by a suite of graph optimizations that effectively convert sequential code into functional code. Then perform a whole bunch of standard optimizations to it, allocate temporary memory nicely to execute that  functional code, and then generate sequential code which efficiently executes it. That sounds really shitty but I don't know other really good options. Sequential code is far too hard to reason about.

#### Converting sequential into functional code.

End Goal: Make code introspection easy, especially evaluating data dependencies and prior computations.

I suspect that we cannot allow recursion for this to really work at all, recursion allows for way too complex of control flow.
