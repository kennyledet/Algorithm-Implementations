/* SCALA Implementation to generate fibonacci sereis upto N numbers. 
 
 	Though all the edge cases are covered, in case you need to check for something please do add
 	a test case for it.

 	Any improvement in the code is highly appreciated. 
*/

class GenerateFibonacci {

  def generateNthFibonacciTerm(num: Int): Int = {
    if (num < 2) num
    else generateNthFibonacciTerm(num - 1) + generateNthFibonacciTerm(num - 2)
  }

  def generateFibonacciSequence(num: Int): String = {
    val rangeList = (0 to num-1).toList
    val fiboList = rangeList.map(x=>generateNthFibonacciTerm(x))

    fiboList.mkString(" ")
  }
}