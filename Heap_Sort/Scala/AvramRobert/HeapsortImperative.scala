/*
 * An imperative implementation of the heapsort algorithm
 */
object HeapsortImperative {

  /*
   * Witness type that allows for generic comparisons between same types.
   */
  trait >=<[A] {
    self =>
    def >(v1: A, v2: A): Boolean

    def <(v1: A, v2: A): Boolean

    implicit class CompOps(a: A) {
      def >(that: A): Boolean = self.>(a, that)

      def <(that: A): Boolean = self.<(a, that)
    }

  }

  @inline
  def left(i: Int): Int = i << 1

  @inline
  def right(i: Int): Int = (i << 1) + 1

  /*
   * Fold operation over tuples.
   */
  def tupleFold[A](t: (A, A))(x: A)(f: (A, A) => A): A = t match {
    case (_1, _2) => f(f(x, _1), _2)
  }

  /*
   * Heapify, with the max heap property, given an array, a `heapsize` and an `index`.
   */
  @annotation.tailrec
  def maxheapify[A](a: Array[A], heapsize: Int, i: Int)(implicit manifest: Manifest[A], c: >=<[A]): Unit = {
    import c._

    val l = left(i)
    val r = right(i)

    val largest = tupleFold((l, r))(i) { (res, cur) =>
      if (cur < heapsize && a(cur) > a(res)) cur
      else res
    }

    if (largest != i) {
      exchange(i, largest, a)
      maxheapify(a, heapsize, largest)
    }
  }

  /*
   * Given an array, build a max heap out of it in a bottom-up manner.
   */
  def buildMaxHeap[A](a: Array[A])(implicit manifest: Manifest[A], c: >=<[A]): Array[A] = {
    for (i <- a.length >> 1 to 0 by -1) {
      maxheapify(a, a.length, i)
    }
    a
  }

  /*
   * Exchange or swap two values in an array.
   */
  def exchange[A](ia: Int, in: Int, a: Array[A]): Unit = {
    val z = a(ia)
    a(ia) = a(in)
    a(in) = z
  }

  def heapsort[A](a: Array[A])(implicit manifest: Manifest[A], c: >=<[A]): Array[A] = {
    def sort(a: Array[A]): Array[A] = {
      for (i <- (a.length - 1) until 0 by -1) {
        exchange(0, i, a)
        maxheapify(a, i, 0)
      }
      a
    }
    (buildMaxHeap[A] _ andThen sort)(a)
  }
}

