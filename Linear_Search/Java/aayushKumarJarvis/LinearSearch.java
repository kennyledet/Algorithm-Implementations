import java.util.Scanner;

public class LinearSearch {

    protected static int linearSearch(int arrayToBeSearched[], int numberToBeSearched) {

        int valueFound = -1;
        for(int loopVariable=0;loopVariable<arrayToBeSearched.length;loopVariable++) {

            if(numberToBeSearched == arrayToBeSearched[loopVariable]) {
                valueFound = loopVariable;
                break;
            }
        }
        return valueFound;
    }

    public static void main(String args[]) {

        Scanner scannerObject = new Scanner(System.in);

        System.out.println("Enter the size of array");
        int sizeOfArray = scannerObject.nextInt();

        int arrayOfElements[] = new int[sizeOfArray];

        System.out.println("Enter the elements in the array");
        for(int loopVariable = 0;loopVariable<sizeOfArray;loopVariable++) {
            arrayOfElements[loopVariable] = scannerObject.nextInt();
        }

        System.out.println("Enter the element to be searched");
        int elementToBeSearched = scannerObject.nextInt();

        int valueFound = linearSearch(arrayOfElements,elementToBeSearched);
        if(valueFound == -1)
            System.out.println("Notfound");
        else
            System.out.println("Found !!");

    }
}



