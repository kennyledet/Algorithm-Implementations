

import org.scalatest.{Matchers, FunSuite}

class EuclideanAlgorithmTest extends FunSuite with Matchers {

  test("Euclidean Algorithm should give") {
    val objectForEuclideanAlgorithm = new EuclideanAlgorithm

    objectForEuclideanAlgorithm.calculateGCD(12,4) should be(4)
    objectForEuclideanAlgorithm.calculateGCD(8,2) should be(2)
    objectForEuclideanAlgorithm.calculateGCD(16,8) should be(8)
  }
}
