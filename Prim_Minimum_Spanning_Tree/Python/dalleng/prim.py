""" Prim's algorithm is used to find a minimum spanning tree for a weighted
connected undirected graph. The following implementation is a simple O(mn)
implementation, being n the number of nodes and m the number of edges.
To improve the running time of the algorithm a priority queue can be used
instead of linear search when looking for the next edge to add to the mst."""


def prim(graph, start):
    mst = set()
    visited = {start}
    nodes, edges = graph

    while len(visited) != len(nodes):
        possible_edges = (e for e in edges if e[0] in visited
                          and e[1] not in visited)
        cheapest_edge = min(possible_edges, key=lambda x: x[2])
        mst.add(cheapest_edge)
        visited.add(cheapest_edge[1])

    return mst
