import org.scalatest.{Matchers, FunSuite}

class LinearSearchScalaTest extends FunSuite with Matchers {

  test("Linear Search should search") {
    val objectForLinearSearch = new LinearSearchScala

    objectForLinearSearch.linearSearch(List(1,2,3,4,5),5) should be(true)
    objectForLinearSearch.linearSearch(List(1,2,3,4,5),7) should be(false)
  }
}


