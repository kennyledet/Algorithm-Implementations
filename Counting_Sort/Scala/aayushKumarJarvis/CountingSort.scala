
class CountingSort {

  def countSort(listToBeSorted: List[Int], minValue: Int, maxValue: Int): List[Int] =

    listToBeSorted.foldLeft(Array.fill(maxValue - minValue + 1)(0)) { (arr, n) =>
      arr(n - minValue) += 1
      arr
    }.zipWithIndex.foldLeft(List[Int]()) {
      case (lst, (cnt, ndx)) => List.fill(cnt)(ndx + minValue) ::: lst
    }.reverse
}

