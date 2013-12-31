object bubble_sort {

  /**
    * Functional, iterative version of bubble sort.
    * @param a the array to be sorted
    * @return the sorted copy of a
    */
  def bubble_sort_func(a: Array[Int]): Array[Int] = {

    def swap(x: Int, y: Int, s: Array[Int]): Unit = {
      val tmp = s(x)
      s(x) = s(y)
      s(y) = tmp
    }

    val s = Array(a: _*)
    var sorted = true

    for (i ← 0 until s.length) {
      sorted = true

      for (j ← 1 until s.length - i) {
        if (s(j) < s(j - 1)) {
          swap(j, j - 1, s)
          sorted = false
        }
      }

      if (sorted) {
        return s
      }
    }
    s
  }

  /**
    * Iterative, inplace version of bubble sort.
    * @param a the array to be sorted
    */
  def bubble_sort_inplace(a: Array[Int]): Unit = {

    def swap(x: Int, y: Int, s: Array[Int]): Unit = {
      val tmp = s(x)
      s(x) = s(y)
      s(y) = tmp
    }

    var sorted = true
    for (i ← 0 until a.length) {
      sorted = true
      for (j ← 1 until a.length - i) {
        if (a(j) < a(j - 1)) {
          swap(j, j - 1, a)
          sorted = false
        }
      }

      if (sorted) {
        return
      }
    }
  }
}
