import java.util.Random;

public class BozoSort {


    protected int[] bozoSort(int[] arrayOfElements) {

        int randomVariable1 = 0;
        int randomVariable2 = 0;
        int temporaryVariable;

        Random randomObject = new Random();


        while(!isSorted(arrayOfElements)) {

            randomVariable1 = randomObject.nextInt(arrayOfElements.length);
            randomVariable2 = randomObject.nextInt(arrayOfElements.length);

            temporaryVariable = arrayOfElements[randomVariable1];
            arrayOfElements[randomVariable1] = arrayOfElements[randomVariable2];
            arrayOfElements[randomVariable2] = temporaryVariable;
        }

        return arrayOfElements;
    }

    protected boolean isSorted(int[] arValues) {

        for (int i = 0; i < arValues.length - 1; i++) {
            if (arValues[i] > arValues[i + 1]) {
                return false;
            }
        }

        return true;
    }
}

