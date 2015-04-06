/* SCALA Implementation of Selection Sort.

  Though the corner cases are covered. But still if you find any additions to it,
  please do add a test for it.

  Any improvements/tests in the code is highly appreciated.
 */

class SelectionSort {

  def swapNumbers(numbersList: Array[Int], i1: Int, i2: Int) = {

    val temp = numbersList(i1)
    numbersList(i1) = numbersList(i2)
    numbersList(i2) = temp
  }

  def selectionSort(inputElements: Array[Int]): Array[Int] = {
    for (i <- 0 until inputElements.size - 1)
      swapNumbers(inputElements, i, (i + 1 until inputElements.size).foldLeft(i)((currentMinimum, currentIndex) =>
        if (inputElements(currentIndex) < inputElements(currentMinimum))
          currentIndex
        else
          currentMinimum
      ))
    inputElements
  }
}


