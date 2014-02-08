/*
 * @author Jared Halpert (ghostsnstuff)
 * @date 2/8/14
 * @complexity O(n)
 * @logic
 *  execution happens once every time the value of n is decremented
 *  the value of n is decremented until it reaches 1
 *  therefore the function is called recursively n times.
 */

public class Factorial {
  
  public int computeFactorial(int n) {
    if(n <= 1) {
      return 1;
    } else {
      return computeFactorial(n-1) * n;
    }
  }

}
