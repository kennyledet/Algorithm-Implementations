import org.scalatest.{Matchers, FunSuite}

class FactorialTest extends FunSuite with Matchers {

  test("Factorial should return") {
    val objectForFactorial = new Factorial

    objectForFactorial.computeFactorial(2) should be("2")
    objectForFactorial.computeFactorial(5) should be("120")
    objectForFactorial.computeFactorial(10) should be("3628800")
    objectForFactorial.computeFactorial(50) should be("30414093201713378043612608166064768844377641568960512000000000000")
  }
}
