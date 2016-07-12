package sieve_of_eratosthenes

object Sieve {

  /*
   * Given an upper bound, starting with 2, generate the list of integers up to that bound, extract
   * the head of that list and filter out those numbers that are divisible by the current head.
   * Repeat.
   */
  def sieveOfEratosthenes(upperBound: Int): Vector[Int] = {

    @annotation.tailrec
    def go(acc: Vector[Int], rem: List[Int]): Vector[Int] = rem match {
        case h :: t => go(acc :+ h, t.filterNot(i => i % h == 0))
        case _ => acc
      }

    go(Vector(), (2 to upperBound).toList)

  }

}
