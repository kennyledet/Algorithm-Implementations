def chebyshevDistance(p: List[Int], q: List[Int]): Int =
    p.zip(q).map { case (p, q) => (p - q).abs }.max