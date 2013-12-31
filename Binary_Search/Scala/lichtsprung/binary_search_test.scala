import org.scalatest.{ Matchers, FlatSpec }
import binary_search._

class binary_search_test extends FlatSpec with Matchers {
  val values = Array(1, 3, 5, 9, 17)
  val expectedPosition = 3
  val target = 9

  "Binary Search" should "find a value and return the position" in {
    val pos = search(values, target)
    pos shouldBe expectedPosition
  }

  it should "return -1 if nothing was found" in {
    val pos = search(values, 4)
    pos shouldBe -1
  }
}
