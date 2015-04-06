
class BubbleSort {

  def bubbleSort[T](arrayToBeSorted: Array[T])(implicit o: Ordering[T]): Array[T] = {

    import o._
    val consecutiveIndices = (arrayToBeSorted.indices, arrayToBeSorted.indices drop 1).zipped
    var hasChanged = true

    while (hasChanged) {

      hasChanged = false
      consecutiveIndices foreach { (i1, i2) =>

        if (arrayToBeSorted(i1) > arrayToBeSorted(i2)) {
          hasChanged = true
          val temporaryVariable = arrayToBeSorted(i1)
          arrayToBeSorted(i1) = arrayToBeSorted(i2)
          arrayToBeSorted(i2) = temporaryVariable
        }
      }
    }

    arrayToBeSorted
  }
}

