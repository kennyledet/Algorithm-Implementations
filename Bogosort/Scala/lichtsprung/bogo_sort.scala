object bogo_sort {

  def sort[T: Ordering](values: Array[T]): Array[T] = {
    values.permutations foreach {
      p ⇒
        if (isSorted(p)) {
          return p
        }
    }
    values
  }

  def sort_v2[T: Ordering](values: Array[T]): Array[T] = {
    values.permutations.find(_.deep == values.sorted.deep).getOrElse(values)
  }

  private def isSorted[T: Ordering](values: Array[T]): Boolean = {
    val ord = Ordering[T]
    import ord._

    for (i ← 1 until values.size) {
      if (values(i - 1) > values(i)) {
        return false
      }
    }
    true
  }
}
