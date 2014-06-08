def manhattan_distance(p, q):
    if len(p) != len(q): return 0
    return sum([abs(p[i] - q[i]) for i in xrange(len(p))])