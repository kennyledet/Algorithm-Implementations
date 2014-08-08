import java.util.Scanner;

public class FibonacciUsingRecursion {

    public static int generateNthTerm(int nthTerm) {
        if(nthTerm == 0)
            return 0;
        else if(nthTerm == 1)
            return  1;
        else
            return generateNthTerm(nthTerm - 1) + generateNthTerm(nthTerm - 2);
    }

    public static void main(String args[]) {

        Scanner inputForClass = new Scanner(System.in);

        System.out.println("Enter the nth term of Fibonacci Series");
        int nthTerm = inputForClass.nextInt();

        int nthtermOfFibonacci = generateNthTerm(nthTerm);

        System.out.println("Nth term of Fibonacci Sequence is "+nthtermOfFibonacci);
    }
}
