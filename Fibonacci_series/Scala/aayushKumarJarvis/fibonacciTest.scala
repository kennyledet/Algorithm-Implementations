import org.scalatest.{Matchers, FunSuite}


class GenerateFibonacciTest extends FunSuite with Matchers {

  test("Fibonacci Sereis should generate") {
    val objectForFibonacci = new GenerateFibonacci

    objectForFibonacci.generateFibonacciSequence(1) should be("0")
    objectForFibonacci.generateFibonacciSequence(2) should be("0 1")
    objectForFibonacci.generateFibonacciSequence(5) should be("0 1 1 2 3")
    objectForFibonacci.generateFibonacciSequence(10) should be("0 1 1 2 3 5 8 13 21 34")
  }

}
