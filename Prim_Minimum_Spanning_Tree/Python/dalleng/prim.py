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


def main():
    nodes = range(1, 10)
    edges = [
        (1, 2, 4),
        (2, 1, 4),
        (1, 8, 8),
        (8, 1, 8),
        (2, 8, 11),
        (8, 2, 11),
        (2, 3, 8),
        (3, 2, 8),
        (3, 9, 2),
        (9, 3, 2),
        (3, 6, 4),
        (6, 3, 4),
        (3, 4, 7),
        (4, 3, 7),
        (4, 5, 9),
        (5, 4, 9),
        (4, 6, 14),
        (6, 4, 14),
        (5, 6, 10),
        (6, 5, 10),
        (6, 7, 2),
        (7, 6, 2),
        (7, 8, 1),
        (8, 7, 1),
        (7, 9, 6),
        (9, 7, 6),
        (8, 9, 7),
        (9, 8, 7)
    ]

    graph = (nodes, edges)
    mst = prim(graph, 1)
    cost = sum(weigth for _, __, weigth in mst)
    expected = 37
    print "Expected: %d Got: %d" % (expected, cost)
    assert cost == expected

if __name__ == '__main__':
    main()
