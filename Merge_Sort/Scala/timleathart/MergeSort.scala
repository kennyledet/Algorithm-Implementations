/** MergeSort algorithm in Scala.
 *  
 *  Written by Tim Leathart, January 2014
 */

object MergeSort {

  def MergeSort(is : List[Int]) : List[Int] = is match {
    case Nil => List()			// Empty list is already sorted
    case h :: Nil => List(h)	// List with one element already sorted 
    case list => {
      val n = list.length / 2	
      Merge(MergeSort(list.take(n)), MergeSort(list.drop(n)))
    }
  }
  
  def Merge(is : List[Int], js : List[Int]) : List[Int] = (is, js) match {
    case (Nil, Nil)  => List()	
  	case (Nil, tail) => tail	
  	case (tail, Nil) => tail
  	case (h1 :: t1, h2 :: t2) => if (h1 < h2) h1 :: Merge(t1, h2 :: t2) else h2 :: Merge(h1 :: t1, t2)
  }
  
}