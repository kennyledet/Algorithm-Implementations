import math.max

object KadanesAlgo {
    def maxSubArray(xs: List[Int]): Int = {
        if (xs.size < 1) { 0 }
        val init = xs(0)
        xs.drop(1).foldLeft((init, init)) { case ((curMax, overallMax), n) =>
            (max(n, curMax + n), max(curMax, overallMax))
        }._2
    }
}