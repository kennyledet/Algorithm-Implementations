import org.scalatest.{Matchers, FunSuite}

class BubbleSortTest extends FunSuite with Matchers {

  test("Bubble Sort should sort") {
    val objectForBubbleSort = new BubbleSort

    objectForBubbleSort.bubbleSort(Array(11,1,4,22)) should be(Array(1,4,11,22))
    objectForBubbleSort.bubbleSort(Array(1,2,3,4,5)) should be(Array(1,2,3,4,5))
  }
}

