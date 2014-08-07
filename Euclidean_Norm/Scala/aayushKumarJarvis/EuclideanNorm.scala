/* SCALA Implementation of Euclidean Norm.
Though the corner cases are covered. But still if you find any additions to it,
please do add a test for it.
Any improvements/tests in the code is highly appreciated.
*/



import scala.math

class EuclideanNorm {

  def calculateEuclideanNorm(listofIntegers: List[Int]):Int = {

    val squaredElements = listofIntegers.map(x => x*x).sum
    math.sqrt(squaredElements).toInt
  }
}
