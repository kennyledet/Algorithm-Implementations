import org.scalatest.{Matchers, FunSuite}

class EuclideanDistanceTest extends FunSuite with Matchers  {

  test("Euclidean distance should compute") {
    val objectForEuclideanDistance = new EuclideanDistance
    val cordinate1 = (2,-1)
    val cordinate2 = (-2,2)

    objectForEuclideanDistance.calculateDistance(cordinate1,cordinate2) should be(5)
  }
}

