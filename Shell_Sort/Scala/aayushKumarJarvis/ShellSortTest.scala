import org.scalatest.{Matchers, FunSuite}

class ShellSortTest extends FunSuite with Matchers {

  test("ShellSort should sort") {
    val objectForShellSort = new ShellSort

    objectForShellSort.shellSort(Array(22,12,45,1,78,3)) should be(Array(1,3,12,22,45,78))
    objectForShellSort.shellSort(Array(1,56,34,67)) should be(Array(1,34,56,67))
    objectForShellSort.shellSort(Array(2,1,3,4)) should be(Array(1,2,3,4))
  }

}
