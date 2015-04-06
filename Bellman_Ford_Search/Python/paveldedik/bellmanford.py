def initialize(G, s):
    """Initialize graph G and vertex s."""
    V, E = G
    d = {v: float('inf') for v in V}
    p = {v: None for v in V}
    d[s] = 0
    return d, p


def bellman_ford(G, w, s):
    """Bellman-Ford's algorithm for shortest-path search. Expects oriented graph.
    Parameter G is a graph represented as a tuple of vertexes and edges. The
    parametr w represents weights of each edge of the graph G (w: E -> R).
    """
    d, p = initialize(G, s)
    V, E = G
    for _ in range(len(V)-1):
        for (u, v) in E:
            if d[v] > d[u] + w[u, v]:
                d[v] = d[u] + w[u, v]
                p[v] = u
    for (u, v) in E:
        if d[v] > d[u] + w[u, v]:
            raise RuntimeError('Graph contains negative cycles.')
    return d, p  # return distances and a tree representing shortest paths


if __name__ == '__main__':
    V = ['A', 'B', 'C', 'D']  # vertexes
    E = [('A', 'B'), ('B', 'C'), ('C', 'D'), ('D', 'B')]  # edges
    w = {('A', 'B'): 1, ('B', 'C'): 3, ('B', 'D'): 1,
         ('C', 'D'): 8, ('D', 'B'): -2}  # weights
    print bellman_ford((V, E), w, 'A')
