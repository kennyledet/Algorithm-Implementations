def euclideanNorm(p: List[Double]): Double =
    math.sqrt(p.map(n => n*n).sum)