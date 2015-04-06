import org.scalatest.{Matchers, FunSuite}

class CountingSortTest extends FunSuite with Matchers {

  test("generateCountList should generate") {
    val objectForCountingSort = new CountingSort

    objectForCountingSort.countSort(List(11,1,22,33,23),1,33) should be(List(1,11,22,23,33))
    objectForCountingSort.countSort(List(1,2,3,4,5,6,7,8,9),1,9) should be(List(1,2,3,4,5,6,7,8,9))
  }
}

