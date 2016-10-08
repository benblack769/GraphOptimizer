#include "basic/basic_kernel.h"
/*
 * Concatenization is finding many instructions with similar chachteristics and turning
 * them into a single instruction. This happens in two main ways:
 * 
 * Depthwise:
 * 
 * The two instructions
 * 
 * comp(x,w)
 *   y = x + 5 
 *   return w + y
 * 
 * Can be considered to be a single binary expression, 
 * 
 * comp(x,w) = (x+5)+w
 * 
 * Which notably does not require any additional memory to compute, past that of x, w and the result.
 * 
 * Note that any computations where one node has a single output can be concatenated.
 * 
 * Even things like (A*B)+(C*D) can be computed with no additional memory
 * assuming at least one of A,B,C,D is only used in this calculation.
 * 
 * 
 * 
 * The other main consideration is even more important: Breadthwise considerations:
 * Turning individual concatenized instructions into standard forms: 
 * 
 * Map, Reduce, Broadcast, and combinations of those.
 * 
 * The imporant combinations are:
 * 
 * MapReduce: well understood 
 * 
 * MultiBroadcast: (simeltaniously broadcasting a whole bunch of numbers to different places. 
 * Important for GPU local memory, and multiprocessor computation).
 * 
 * BroadcastMap: Also well understood.
*/

void basic_kernel::concatenize(){
    comp_graph oldgraph = this->graph;
    
}
