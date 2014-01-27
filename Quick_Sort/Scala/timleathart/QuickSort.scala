/** QuickSort algorithm in Scala.
 *  
 *  Written by Tim Leathart, January 2014
 */

object QuickSort {
  def QuickSort  (is : List[Int]) : List[Int] = is match {
    case Nil => List() 			// Empty list already sorted
    case h :: Nil => List(h)	// List with one item already sorted
    case h :: tail => {		
      val less = QuickSort(tail.filter(x => x < h))	
      val more = QuickSort(tail.filter(x => x >= h))
      less ++ List(h) ++ more
	}
  }
  
}