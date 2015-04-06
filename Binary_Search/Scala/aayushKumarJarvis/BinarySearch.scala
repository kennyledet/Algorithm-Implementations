/* SCALA Implementation of Binary Search.

  Though the corner cases are covered. But still if you find any additions to it,
  please do add a test for it.

  Any improvements/tests in the code is highly appreciated.
 */

class BinarySearch {

  def binarySearch(targetArray: Array[Int], numberToBeSearched: Int): Int = {

    def binarySearchSupport(list: Array[Int], target: Int, start: Int, end: Int): Int = {
      if (start>end) return -1

      val mid = start + (end-start+1)/2

      list match {
        case (arr:Array[Int]) if (arr(mid)==target) => mid
        case (arr:Array[Int]) if (arr(mid)>target) => binarySearchSupport(list, target, start, mid-1)
        case (arr:Array[Int]) if (arr(mid)<target) => binarySearchSupport(list, target, mid+1, end)
      }
    }
    binarySearchSupport(targetArray, numberToBeSearched, 0, targetArray.length-1)
  }
}