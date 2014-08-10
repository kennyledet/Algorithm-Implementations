import java.util.Scanner;
import java.util.*;

public class SieveOfEratosthenes {

    public static Stack generatePrimeNumbers(int limit) {

        boolean[] arrayOfElements = new boolean[limit+1];

        for(int loopingVariable = 2; loopingVariable < arrayOfElements.length; loopingVariable++)
            arrayOfElements[loopingVariable] = true;

        for(int loopingVariable = 2; loopingVariable*loopingVariable <= limit; loopingVariable++) {

            for(int secondryVariable = loopingVariable; secondryVariable*loopingVariable <= limit; secondryVariable++) {

                arrayOfElements[loopingVariable*secondryVariable] = false;
            }
        }

        Stack stackOfPrimes = new Stack();

        for(int loopingVariable = 2; loopingVariable <= limit; loopingVariable++) {
            if (arrayOfElements[loopingVariable]) {
                stackOfPrimes.push(loopingVariable);
            }
        }
        return stackOfPrimes;
    }

    public static void main(String[]args) {

        Scanner scannerObject = new Scanner(System.in);

        System.out.println("Enter the limit upto which prime numbers are to be generated");
        int limit = scannerObject.nextInt();

        Stack stackOfPrimes = generatePrimeNumbers(limit);
        while(!stackOfPrimes.isEmpty())
            System.out.println(stackOfPrimes.pop());
    }
}

