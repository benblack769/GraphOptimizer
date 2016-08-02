
Given two outputs, the parrelizablility is very roughly the number of nodes that can be computed without shared nodes being required. This most closely represents the benefit of calculating the two different outputs on two different threads on the same processor, but there are very similar calculations that have other important implications.

    num_independent_of(ind,of):
        depend = 0
        for p in parent_tree(ind):
            depend += int(p not in parent_tree(of))

    parrelizablility(out1,out2):
        return min(num_independent_of(out1,out2),num_independent_of(out2,out1))

This represents cost of starting two new processes without shared memory:

    shared_reads(out1,out2):
        borders = 0
        for p in (full_tree(out1) union full_tree(out2)):
            borders += int(p is on the border of the tree of one of the outputs and the intersection of the two trees)
        return borders

So the benefit of starting processes on two processes is:

    distributability(out1,out2) = parrelizablility(out1,out2) - cost_copy * shared_reads(out1,out2)

This represents the unnecessary load placed on the cache by computing them in sequence using the same cache:

    cache_cost(out1,out2):
        return num_independent_of(out1,out2) + num_independent_of(out2,out1)

A related measure that measure the minimum number of sequential moves possible is:

    fully_parrelelized_cost(out1,out2) =
        sum(
            (if p1.is_dependent_on(p2) or p2.is_dependent_on(p1) then 1 else 0)
                for p1 in parents(out1)
                    for p2 in parents(out2)
        )


This really only leaves vectorizability!

Oh yeah, and also dealing with grouping outputs.

Greedy algorithm: Choose random entry. Out of all output nodes, choose the one with the least parrelizability with the original one. If the benefit e

Crude visualization: Graph of 




Algorithm for approximately optimal vectorization

GOAL:

A vector path is defined by nodes passing through adjacent memory as much as possible. This may not be always, but one that only has one vector "deviations" (using non-adjacent memory), is better than one with two.
