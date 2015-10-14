
class HeapsortImperative_test extends WordSpec with Matchers {

  val array = Array(12, 42, 54, 234, 64, 340, 21, 23, 56, 40)

  implicit val witness = new >=<[Int] {
    override def >(v1: Int, v2: Int): Boolean = v1 > v2

    override def <(v1: Int, v2: Int): Boolean = v1 < v2
  }

  "A heapsort implementation" should {

    @annotation.tailrec
    def maxHeapCheck(a: Array[Int], index: Int): Unit = {
      if(index < a.length) {
        val leftAssertion = if(left(index) < a.length) a(index) >= a(left(index)) else true
        val rightAssertion = if(right(index) < a.length) a(index) >= a(right(index)) else true

        leftAssertion shouldBe true
        rightAssertion shouldBe true
        maxHeapCheck(a, index + 1)
      }
    }

    "correctly build a max heap" in {
      val maxheap = buildMaxHeap(array)
      maxHeapCheck(maxheap, 0)
    }

    "sort elements using a max heap" in {
      val withHeapsort = heapsort(array).toList
      val withDefaultSort = array.sorted.toList

      withHeapsort.size shouldBe withDefaultSort.size

      (withHeapsort zip withDefaultSort).forall(t => t._1 == t._2) shouldBe true
    }
  }

}
