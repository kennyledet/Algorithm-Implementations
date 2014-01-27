object QuickSort_Test {

  def main(args: Array[String]): Unit = {
    val list = List(5,2,5,7,8,1,2,4,6,8,2,3)    
    println("Before: " + list.mkString(", "))
    
    val sorted = QuickSort.QuickSort(list);
    println("After: " + sorted.mkString(", "))
  }

}
