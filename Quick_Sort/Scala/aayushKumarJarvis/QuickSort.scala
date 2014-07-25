/* SCALA Implementation of Quick Sort.

  Though the corner cases are covered. But still if you find any additions to it,
  please do add a test for it.

  Any improvements/tests in the code is highly appreciated.
 */

class QuickSort {
  
  def quickSort(listToBeSorted: List[Int]): List[Int] =
    if (listToBeSorted.isEmpty) {
      listToBeSorted
    }
    else {
      val (smaller, bigger) = listToBeSorted.tail partition (_ < listToBeSorted.head)
      quickSort(smaller) ::: listToBeSorted.head :: quickSort(bigger)
    }
}