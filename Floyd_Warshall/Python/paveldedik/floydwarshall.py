def floyd_warshall(W):
    """Floyd-Warshall algorithm for shortest-path search between all vertexes of
    the graph W. W is represented with an adjacancy matrix.
    """
    n = len(W)
    D = {x: None for x in range(n)}
    D[0] = list(W)
    for k in range(1, n+1):
        D[k] = list(D[k-1])
        for i in range(n):
            for j in range(n):
                D[k][i][j] = min(D[k-1][i][j], D[k-1][i][k-1] + D[k-1][k-1][j])
    return D[n]


if __name__ == '__main__':
    INF = float('inf')
    W = [[0, 1, INF, INF],
         [INF, 0, 3, 1],
         [INF, INF, 0, 8],
         [INF, 2, INF, 0]]
    print floyd_warshall(W)
