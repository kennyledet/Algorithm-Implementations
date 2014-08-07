class BogoSort {

  def isSorted(l:List[Int]): Boolean = l match {
    case Nil => true
    case x :: Nil => true
    case x :: xs => x <= xs.head && isSorted(xs)
  }
  
  def bogoSortMethod(listForShuffle: List[Int]):List[Int] = {

    val shuffledList = util.Random.shuffle(listForShuffle)

    if(isSorted(shuffledList)) shuffledList
    else
      bogoSortMethod(shuffledList)
  }
}

