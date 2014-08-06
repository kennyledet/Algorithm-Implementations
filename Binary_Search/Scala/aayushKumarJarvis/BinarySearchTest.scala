import org.scalatest.{Matchers, ShouldMatchers, FunSuite}

class BinarySearchTest extends FunSuite with Matchers {

  test("Should search for") {

    val objectForBinarySearch = new BinarySearch

    objectForBinarySearch.binarySearch(Array(1,2,3,4,5),3) should be(2)
    objectForBinarySearch.binarySearch(Array(1,2,3,4,5),4) should be(3)
    objectForBinarySearch.binarySearch(Array(0,0,0,1,1,1),1) should be(3)
  }
}
