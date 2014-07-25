import org.scalatest.{Matchers, FunSuite}

class QuickSortTest extends FunSuite with Matchers {

  test("Quick Sort should sort") {
    val objectForQuickSort = new QuickSort

    objectForQuickSort.quickSort(List(2,1,55,21,58)) should be(List(1,2,21,55,58))
    objectForQuickSort.quickSort(List(1,1,2,2,6,6,5,5)) should be(List(1,1,2,2,5,5,6,6))
    objectForQuickSort.quickSort(List(0,22,1,45)) should be(List(0,1,22,45))
    objectForQuickSort.quickSort(List(100,99,98,97,91)) should be(List(91,97,98,99,100))
  }

}