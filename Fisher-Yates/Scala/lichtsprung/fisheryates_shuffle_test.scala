import org.scalatest.{ Matchers, FlatSpec }
import fisheryates_shuffle._

class fisheryates_shuffle_test extends FlatSpec with Matchers {

  "Fisher-Yates Shuffle (inplace)" should "shuffles the values of the array inplace" in {
    val values = Array(1, 2, 3, 4, 5)
    shuffle_inplace(values)
    values should contain allOf (1, 2, 3, 4, 5)
    values should contain inOrder (1, 2, 3, 4, 5)
    values.permutations.find(_.deep == values.deep).nonEmpty shouldBe true
  }

  "Fisher-Yates Shuffle" should "return a random permutation of the source array" in {
    val values = Array(1, 2, 3, 4, 5)
    val shuffled = shuffle(values)
    shuffled should contain allOf (1, 2, 3, 4, 5)
    values should contain inOrder (1, 2, 3, 4, 5)
    values.permutations.find(_.deep == shuffled.deep).nonEmpty shouldBe true
  }
}
