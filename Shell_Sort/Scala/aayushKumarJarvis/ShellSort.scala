/* SCALA Implementation of Selection Sort.

  Though the corner cases are covered. But still if you find any additions to it,
  please do add a test for it.

  Any improvements/tests in the code is highly appreciated.
 */

class ShellSort {

  def incSeq(len: Int) = new Iterator[Int] {

    private[this] var x: Int = len / 2

    def hasNext = x > 0

    def next() = {
      x =
        if (x == 2) 1
        else x * 5 / 11
      x
    }
  }

  def InsertionSort(a: Array[Int], inc: Int) = {
    for (i <- inc until a.length; temp = a(i)) {
      var j = i
      while (j >= inc && a(j - inc) > temp) {
        a(j) = a(j - inc)
        j = j - inc
      }
      a(j) = temp
    }
  }

  def shellSort(arrayToBeSorted:Array[Int]): Array[Int] = {
    for (inc <- incSeq(arrayToBeSorted.length)) InsertionSort(arrayToBeSorted, inc)

  arrayToBeSorted
  }
 }


