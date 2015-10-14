/*
 * A functional implementation of the heapsort algorithm
 * /
object HeapsortFunctional {
  /*
   * Witness type that allows for generic comparisons between same types.
   */
  trait >=<[A] { self =>
    def >(v1: A, v2: A): Boolean

    def <(v1: A, v2: A): Boolean

    implicit class CompOps(a: A) {
      def >(that: A): Boolean = self.>(a, that)

      def <(that: A): Boolean = self.<(a, that)
    }
  }

  @inline
  def left(i: Int): Int = (i << 1) + 1

  @inline
  def right(i: Int): Int = (i << 1) + 2

  /*
   * A heap is, essentially, a binary tree that satisfies one of two properties, max or min.
   * Functionally, this is modelled as one would model an immutable implementation of a
   * binary tree.
   */
  sealed trait Heap[+A]
  case class Node[A](a: A, left: Heap[A] = Leaf, right: Heap[A] = Leaf) extends Heap[A]
  case object Leaf extends Heap[Nothing]

  /*
   * "Sink" new nodes down the heap, whilst preserving the max heap property.
   */
  def sink[A](x: A, left: Heap[A], right: Heap[A])(implicit c: >=<[A]): Heap[A] = {
    import c._
    (left, right) match {
      case (Node(y, _, _), Node(z, l, r)) if z > y && x < z => Node(z, left, sink(x, l, r))
      case (Node(y, l, r), _) if x < y => Node(y, sink(x, l, r), right)
      case (_, _) => Node(x, left, right)
    }

  }

  /*
   * "Float" existing nodes up the heap, whilst preserving the max heap property.
   */
  def float[A](l: Heap[A], r: Heap[A])(implicit c: >=<[A]): Heap[A] = {
    import c._
    (l, r) match {
      case (Leaf, Leaf) => Leaf
      case (Leaf, n) => n
      case (n, Leaf) => n
      case (Node(a1, l1, r1), Node(a2, _, _)) if a1 > a2 => Node(a1, float(l1, r1), r)
      case (Node(a1, _, _), Node(a2, l2, r2)) if a2 > a1 => Node(a2, l, float(l2, r2))
    }
  }

  /*
   * Extract the root/head of the tree and rebalance it, such that the heap property isn't violated.
   */
  def head[A](h: Heap[A])(implicit c: >=<[A]): (Option[A], Heap[A]) = {
    h match {
      case Leaf => (None, Leaf)
      case Node(a, Leaf, l) => (Some(a), float(Leaf, l))
      case Node(a, r, Leaf) => (Some(a), float(r, Leaf))
      case Node(a, l, r) => (Some(a), float(l, r))
    }
  }

  /*
   * Given a `Vector[A]`, build a heap with a max property out of it.
   */
  def maxHeap[A](v: Vector[A])(implicit c: >=<[A]): Heap[A] = {
    def go(i: Int): Heap[A] = {
      if(i < v.length) sink(v(i), go(left(i)), go(right(i)))
      else Leaf
    }
    go(0)
  }

  /*
   * Given a `Vector[A]`, build a max heap out of it, start extracting its root and rebalance it after each extraction.
   */
  def heapsort[A](v: Vector[A])(implicit c: >=<[A]): Vector[A] = {
    @annotation.tailrec
    def go(heap: Heap[A], acc: Vector[A], s: Int): Vector[A] = {
      if(s <= 0) acc
      else head(heap) match {
        case (Some(ha), h) => go(h, acc.+:(ha), s - 1)
        case (None, h) => acc
      }
    }

    go(maxHeap(v), Vector(), v.size)
  }

}
