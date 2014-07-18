import org.scalatest.{Matchers, FunSuite}

class SelectionSortTest extends FunSuite with Matchers {

  test("Selection Sort should sort") {
    val objectForSelectionSort = new SelectionSort

    objectForSelectionSort.selectionSort(Array(0,1,2,3,4,5)) should be(Array(0,1,2,3,4,5))
    objectForSelectionSort.selectionSort(Array(33,22,25,31)) should be(Array(22,25,31,33))
    objectForSelectionSort.selectionSort(Array(0)) should be(Array(0))
    objectForSelectionSort.selectionSort(Array(1,1,0,0)) should be(Array(0,0,1,1))
  }

}
