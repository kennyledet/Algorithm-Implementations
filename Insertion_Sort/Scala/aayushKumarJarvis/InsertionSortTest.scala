import org.scalatest.{Matchers, FunSuite}

class InsertionSortTest extends FunSuite with Matchers {

  test("Insertion Sort should sort") {
    val objectForInsertionSort = new InsertionSort

    objectForInsertionSort.insertionSort(List(1,45,23,89,11)) should be(List(1,11,23,45,89))
    objectForInsertionSort.insertionSort(List(1,1,0,0,3,3,2,2)) should be(List(0,0,1,1,2,2,3,3))
    objectForInsertionSort.insertionSort(List(100,99,98,97,91)) should be(List(91,97,98,99,100))
  }
}
