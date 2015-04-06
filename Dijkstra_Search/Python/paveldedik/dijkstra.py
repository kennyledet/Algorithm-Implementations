def initialize(G, s):
    """Initialize graph G and vertex s."""
    V, E = G
    d = {v: float('inf') for v in V}
    p = {v: None for v in V}
    d[s] = 0
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
    return d, p  # return distances and a tree representing shortest paths


if __name__ == '__main__':
    V = ['A', 'B', 'C', 'D']  # vertexes
    E = [('A', 'B'), ('B', 'C'), ('C', 'D'), ('D', 'B')]  # edges
    w = {('A', 'B'): 1, ('B', 'C'): 3, ('B', 'D'): 1,
         ('C', 'D'): 8, ('D', 'B'): 2}  # weights
    print dijkstra((V, E), w, 'A')
