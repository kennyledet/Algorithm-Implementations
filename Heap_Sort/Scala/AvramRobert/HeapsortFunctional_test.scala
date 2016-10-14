
class HeapsortFunctional_test extends WordSpec with Matchers {

  val vec = Vector(12, 42, 54, 234, 64, 340, 21, 23, 56, 40)

  implicit val witness = new >=<[Int] {
    override def >(v1: Int, v2: Int): Boolean = v1 > v2

    override def <(v1: Int, v2: Int): Boolean = v1 < v2
  }

  "A heapsort implementation" should {

    def maxheapCheck(h: Heap[Int]): Unit = h match {
      case Node(ac, Leaf, r@Node(ar, _, _)) =>
        ac >= ar shouldBe true
        maxheapCheck(r)
      case Node(ac, l@Node(al, _, _), Leaf) =>
        ac >= al shouldBe true
        maxheapCheck(l)
      case Node(ac, l@Node(al, _, _), r@Node(ar, _, _)) =>
        val leftAssertion = ac >= al
        val rightAssertion = ac >= ar
        leftAssertion shouldBe true
        rightAssertion shouldBe true

        maxheapCheck(l)
        maxheapCheck(r)
      case _ =>
    }

    @annotation.tailrec
    def balanceCheck(h: Heap[Int]): Unit = h match {
      case Leaf =>
      case _ =>
        val (_, t) = head(h)
        maxheapCheck(t)
        balanceCheck(t)
    }

    "correctly build a max heap" in {
      val heap = maxHeap(vec)
      maxheapCheck(heap)
    }

    "consistently rebalance the max heap correctly when the root is removed" in {
      val heap = maxHeap(vec)
      balanceCheck(heap)
    }

    "sort using a max heap" in {
      val withHeapsort = heapsort(vec)
      val withDefault = vec.sorted

      withHeapsort.size shouldBe withDefault.size

      (withHeapsort zip withDefault).forall(t => t._1 == t._2) shouldBe true
    }
  }
}
