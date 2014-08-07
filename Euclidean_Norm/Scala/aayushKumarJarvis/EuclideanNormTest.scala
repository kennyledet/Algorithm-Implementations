import org.scalatest.{Matchers, FunSuite}

class calculateEuclideanNormTest extends FunSuite with Matchers {

  test("Euclidean Norm should give") {
    val objectForEuclideanNorm = new EuclideanNorm

    objectForEuclideanNorm.calculateEuclideanNorm(List(1,2,3)) should be(3)
    objectForEuclideanNorm.calculateEuclideanNorm(List(3,4)) should be(5)
    objectForEuclideanNorm.calculateEuclideanNorm(List(1,1,1,1)) should be(2)
  }
}
