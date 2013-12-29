import org.scalatest.{ Matchers, FlatSpec }
import kmeans_clustering._

class kmeans_clustering_test extends FlatSpec with Matchers {
  "A list of vectors" should "be clustered into 2 clusters" in {
    val vectors =
      Vector(1, 0, 0) :: Vector(0, 0, 1) ::
        Vector(4, 0.1, 0) :: Vector(0, 0.1, 6.3) :: Nil

    val clusters = kmeans(vectors, 2)

    clusters.size shouldBe 2
    clusters.collect {
      case c ⇒ c.centre
    } should contain allOf (Vector(2.5, 0.05, 0.0), Vector(0.0, 0.05, 3.65))
  }
}
