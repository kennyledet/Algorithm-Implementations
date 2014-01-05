import org.scalatest.{ Matchers, FlatSpec }
import bogo_sort._

class bogo_sort_test extends FlatSpec with Matchers {
  val values = Array(1, 17, -4, 2)

  "Bogo Sort" should "sort an array of Ints" in {
    val sorted = sort(values)
    sorted should contain inOrder (-4, 1, 2, 17)
  }

  "Bogo Sort V2" should "sort an array of Ints by looking for the sorted array in the iterator of all permutations " in {
    val sorted = sort_v2(values)
    sorted should contain inOrder (-4, 1, 2, 17)
  }
}
