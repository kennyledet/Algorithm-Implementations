def euclidean_distance(q, p)
    assert(p.length == q.length, "Vector lengths don't match!")
    # Notice the nice inject(:+) expression
    Math.sqrt q.zip(p).map {|u, v| (u-v)**2}.inject(:+)
end