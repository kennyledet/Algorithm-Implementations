/* SCALA Implementation of Factorial of Small and Big Numbers.

  Though the corner cases are covered. But still if you find any additions to it,
  please do add a test for it.

  Any improvements/tests in the code is highly appreciated.
 */
 
class Factorial {

 def computeFactorial(num : Int):String = {

    (2 to num).foldLeft(BigInt(1))(_*_).toString()
  }
}
