object binary_search {

  def search[T: Ordering](values: Array[T], target: T): Int = {
    val ord = Ordering[T]
    import ord._

    if (values.size < 1) {
      return -1
    }

    val mid = values.size / 2
    val midValue = values(mid)

    if (midValue > target) {
      return search(values.slice(0, mid), target)
    } else if (midValue < target) {
      val p = search(values.slice(mid + 1, values.size), target)
      if (p < 0) return -1 else return mid + 1 + p
    }
    mid
  }

}
