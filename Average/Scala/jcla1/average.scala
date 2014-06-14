object Average {
    def arithmeticMean(xs: List[Double]): Double = xs.sum / xs.size

    def geometricMean(xs: List[Double]): Double =
        math.pow(xs.product, 1.0 / xs.size)
}