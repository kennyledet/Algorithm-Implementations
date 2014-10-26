object Average {
    def arithmeticMean(xs: List[Double]): Double = xs.sum / xs.size

    def geometricMean(xs: List[Double]): Double =
        math.pow(xs.product, 1.0 / xs.size)

    def harmonicMean(xs: List[Double]): Double =
        xs.size  / xs.map(n => 1.0 / n).sum

    def generalizedMean(xs: List[Double], power: Double): Double =
        math.pow(1.0 / xs.size * xs.map(n => math.pow(n, power)).sum,
            1.0 / power)

    def weightedMean(xs: List[Double], weights: List[Double]): Double =
        xs.zip(weights).map(t => t._1 * t._2).sum / weights.sum

    def midrangeMean(xs: List[Double]): Double =
        0.5 * (xs.max + xs.min)

    def energaticMean(xs: List[Double]): Double =
        10 * math.log10(xs.map(n => math.pow(n, n / 10)).sum / xs.size)
}