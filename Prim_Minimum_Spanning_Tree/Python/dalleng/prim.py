import sys

""" Prim's algorithm is used to find a minimum spanning tree for an undirected
graph. The following implementation is a simple O(mn) implementation, being
n the number of nodes and m the number of edges. To improve the running time
of the algorithm a priority queue can be used instead of linear search when
looking for the next edge to add to the mst."""


def graph_from_file(filename):
    """ Utility function to read a graph from a file.
    The function expects a file with the number of nodes and edges separated
    by spaces in the first line, and weighted edges in the following lines.
    """
    with open(filename) as fsock:
        fsock.next()
        nodes = set()
        edges = set()

        for line in fsock:
            head, tail, weigth = line.split()
            head, tail, weigth = int(head), int(tail), int(weigth)
            edges.add((head, tail, weigth))
            edges.add((tail, head, weigth))
            nodes.update((head, tail))

    return (nodes, edges)


def prim(graph, start):
    mst = set()
    visited = {start}
    nodes, edges = graph

    while visited != nodes:
        possible_edges = (e for e in edges if e[0] in visited
                          and e[1] not in visited)
        cheapest_edge = min(possible_edges, key=lambda x: x[2])
        mst.add(cheapest_edge)
        visited.add(cheapest_edge[1])

    return mst


def main():
    # list of test cases and expected results
    test_cases = [
        ('test1.txt', 37),
        ('test2.txt', 120971),
        ('test3.txt', -3612829),
    ]

    # use --test in the command-line to run tests
    if sys.argv[1] == '--test':
        for filename, result in test_cases:
            graph = graph_from_file(filename)
            mst = prim(graph, 1)
            cost = sum(weigth for _, __, weigth in mst)
            print filename
            print result == cost
            print 'expected: %d got: %d' % (result, cost)
            print 80 * '-'
    else:
    # the file with the graph is read from command-line arguments
        graph = graph_from_file(sys.argv[1])
        mst = prim(graph, 1)
        cost = sum(weigth for _, __, weigth in mst)
        print cost


if __name__ == '__main__':
    main()
