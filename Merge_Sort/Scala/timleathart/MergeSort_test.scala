object MergeSort_test {
	def main(args : Array[String]) {
	  val unsorted = List(1,5,2,6,7,4,7,3,2,2,1,2,6,8,9,9,3,6,3)
	  println(unsorted.mkString(", "))
	  
	  val sorted = MergeSort.MergeSort(unsorted)
	  println(sorted.mkString(", "))
	}
}