public class Factorial {

  public static void main(String args[]) {
    System.out.print("computeFactorial(5) = ");
    System.out.println(computeFactorial(5));
  }
  
  // recurisve implementation
  public static int computeFactorial(int n) {
    if(n <= 1) {
      return 1;
    } else {
      return computeFactorial(n-1) * n;
    }
  }

}
