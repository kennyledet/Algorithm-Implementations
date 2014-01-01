import org.scalatest.{ Matchers, FlatSpec }
import bresenham_line._

class bresenham_line_test extends FlatSpec with Matchers {
  "A bresenham line between (0,0) and (5,5)" should "consist of 5 points" in {
    val it = bresenham(0, 0, 5, 5)
    it.size shouldBe 5
  }

  it should "return an iterator with points (0,0), (1,1), (2,2), (3,3), (4,4)" in {
    val it = bresenham(0, 0, 5, 5)
    val expected = Array(Point(0, 0), Point(1, 1), Point(2, 2), Point(3, 3), Point(4, 4))
    it.toArray.deep shouldBe expected.deep
  }
}
