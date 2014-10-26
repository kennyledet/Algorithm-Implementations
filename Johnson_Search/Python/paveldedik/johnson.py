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
    return d, p


def dijkstra(G, w, s):
    """Dijkstra's algorithm for shortest-path search."""
    d, p = initialize(G, s)
    V, E = G
    S = set(V)
    while S:
        u = min(S, key=lambda x: d[x])
        S = S - {u}
        for (t, v) in E:
            if t == u and d[v] > d[u] + w[u, v]:
                d[v] = d[u] + w[u, v]
                p[v] = u
    return d, p


def johnson(G, w):
    """Johnson's algorithm for shortest-path search between all vertexes of
    the graph G. G is represented with an adjacancy list. The parameter w
    represents weights of edges.
    """
    V, E = G
    G_ = (V + ['S'], E + [('S', v) for v in V])
    V_, E_ = G_
    w_ = dict(w.items() + [((u, v), 0) for (u, v) in E_ if u == 'S'])
    d, p = bellman_ford(G_, w_, 'S')
    h = {}
    for v in V:
        h[v] = d[v]
    w__ = {}
    for (u, v) in E:
        w__[u, v] = w[u, v] + h[u] - h[v]
    D = {(u, v): None for u in V for v in V}
    for u in V:
        d_, p_ = dijkstra(G, w__, u)
        for v in V:
            D[u, v] = d_[v] + h[v] - h[u]
    return D


if __name__ == '__main__':
    V = ['A', 'B', 'C', 'D']  # vertexes
    E = [('A', 'B'), ('B', 'C'), ('C', 'D'), ('D', 'B')]  # edges
    w = {('A', 'B'): 1, ('B', 'C'): 3, ('B', 'D'): 1,
         ('C', 'D'): 8, ('D', 'B'): -2}  # weights
    print johnson((V, E), w)
