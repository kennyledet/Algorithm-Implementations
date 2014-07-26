  import org.scalatest.{Matchers, FunSuite}

  class MergeSortTest extends FunSuite with Matchers {

    test("Merge Sort should sort") {
      val objectForMergeSort = new MergeSort

      objectForMergeSort.apply(List(22,11,1,44)) should be(List(1,11,22,44))
      objectForMergeSort.apply(List(33,1,77,24,67)) should be(List(1,24,33,67,77))
      objectForMergeSort.apply(List(1,1,55,55,0,0)) should be(List(0,0,1,1,55,55))
    }
  }
