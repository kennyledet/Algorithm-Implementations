import scala.util.Random

object fisheryates_shuffle {

  def shuffle_inplace[T](values: Array[T]): Unit = {
    for (i ← values.size to 1) swap(i, Random.nextInt(i), values)
  }

  def shuffle[T](values: Array[T]): Array[T] = {
    val shuffled = values.clone()
    for (i ← shuffled.size to 1) swap(i, Random.nextInt(i), shuffled)
    shuffled
  }

  private def swap[T](x: Int, y: Int, s: Array[T]): Unit = {
    val tmp = s(x)
    s(x) = s(y)
    s(y) = tmp
  }
}
