
import org.scalatest.{Matchers, FunSuite}

class BogoSortTest extends FunSuite with Matchers {

  test("Bogosort should sort") {
    val objectForBogoSort = new BogoSort

    objectForBogoSort.bogoSortMethod(List(1,2,3,4,5)) should be(List(1,2,3,4,5))
    objectForBogoSort.bogoSortMethod(List(11,4,2,6,1)) should be(List(1,2,4,6,11))
    objectForBogoSort.bogoSortMethod(List(55,44,33,22,11,0)) should be(List(0,11,22,33,44,55))
  }

}

