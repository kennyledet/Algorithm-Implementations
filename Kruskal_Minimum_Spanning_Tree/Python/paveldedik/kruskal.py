class DisjointSet(object):
    """Simple implementation of disjoint-set data structure."""

    def __init__(self, key):
        self.key = key
        self.parent = None
        self.rank = 0

    def __eq__(self, other):
        if isinstance(other, type(self)):
            return self.key == other.key
        return False

    def __ne__(self, other):
        return not (self == other)


def find_set(x):
    """Finds representant of the given data structure x."""
    if x.parent is None:
        return x
    x.parent = find_set(x.parent)
    return x.parent


def union(x, y):
    """Joins two subsets into a single subset."""
    x = find_set(x)
    y = find_set(y)
    if x.rank > y.rank:
        y.parent = x
    else:
        x.parent = y
        if x.rank == y.rank:
            y.rank += 1


def kruskal(G, w):
    """Implementation of Kruskal's algorithm. Returns minimal spanning
    tree for the given graph G and wights w.
    """
    V, E = G
    s = {}
    for v in V:
        s[v] = DisjointSet(v)
    K = []
    for (u, v) in sorted(E, key=lambda e: w[e]):
        if find_set(s[u]) != find_set(s[v]):
            K = K + [(u, v)]
            union(s[u], s[v])
    return K


if __name__ == '__main__':
    V = ['A', 'B', 'C', 'D']  # vertexes
    E = [('A', 'B'), ('B', 'C'), ('C', 'D'), ('D', 'B')]  # edges
    w = {('A', 'B'): 1, ('B', 'C'): 3, ('B', 'D'): 1,
         ('C', 'D'): 8, ('D', 'B'): 2}  # weights
    print kruskal((V, E), w, 'A')
