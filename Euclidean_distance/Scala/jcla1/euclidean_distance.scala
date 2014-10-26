def euclideanDistance(p: List[Int], q: List[Int]): Int =
    math.sqrt(p.zip(q).map { case (u, v) => math.pow(u-v, 2) }.sum)