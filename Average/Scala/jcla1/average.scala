object Average {
    def arithmeticMean(xs: List[Double]): Double = xs.sum / xs.size

    def geometricMean(xs: List[Double]): Double =
        math.pow(xs.product, 1.0 / xs.size)

    def harmonicMean(xs: List[Double]): Double =
        xs.size  / xs.map(n => 1.0 / n).sum
}