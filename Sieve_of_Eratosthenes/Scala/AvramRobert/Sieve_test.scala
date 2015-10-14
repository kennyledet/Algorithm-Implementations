
class Sieve_test extends WordSpec with Matchers {

  "The Sieve of Eratosthenes" should {

    "provide prime numbers up to a certain bound" in {
      val primesBelowOneHundred = Vector(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97)

      val withSieve = sieveOfEratosthenes(100)

      withSieve.size shouldBe primesBelowOneHundred.size
      (withSieve zip primesBelowOneHundred).forall(t => t._1 == t._2) shouldBe true
    }
  }

}
