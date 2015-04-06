import org.scalatest.{ Matchers, FlatSpec }
import bubble_sort._

class bubble_sort_test extends FlatSpec with Matchers {
  "Bubble Sort (functional)" should "sort an array and leave the original array unchanged" in {
    val ints = Array(3, 2, 4, 1, 5)
    val sortedInts = bubble_sort_func(ints)
    sortedInts should contain inOrder (1, 2, 3, 4, 5)
    ints should contain inOrder (3, 2, 4, 1, 5)
  }

  "Bubble Sort (inplace)" should "sort an array" in {
    val ints = Array(3, 2, 4, 1, 5)
    bubble_sort_inplace(ints)
    ints should contain inOrder (1, 2, 3, 4, 5)
  }

}
