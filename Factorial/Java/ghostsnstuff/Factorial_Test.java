public class Factorial_Test {
  
  public static void main(String[] args) {
    System.out.println("The anticipated output for 5! = 120"); 
    Factorial factorial = new Factorial();
    int result = factorial.computeFactorial(5);
    System.out.print("factorial.computeFactorial(5) = ");
    System.out.println(result);
  }

}
