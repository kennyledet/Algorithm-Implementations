import scala.annotation.tailrec

object euclidean_algorithm {

  @tailrec
  def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
}
