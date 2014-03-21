import org.scalatest.{ Matchers, FlatSpec }
import euclidean_algorithm._

class euclidean_algorithm_test extends FlatSpec with Matchers {
  "The greatest common denominator of 210 and 45" should "be 15" in {
    val a = 210
    val b = 45

    gcd(a, b) shouldBe 15
  }
}
