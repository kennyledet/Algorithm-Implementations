
public class GenomeSort {

    protected int[] genomeSort(int[] arrayOfElements) {

        int i = 1;
        int j = 2;

        while (i < arrayOfElements.length) {
            if (arrayOfElements[i - 1] <= arrayOfElements[i]) {
                i = j;
                j++;
            }
            else {
                int tmp = arrayOfElements[i - 1];
                arrayOfElements[i - 1] = arrayOfElements[i];
                arrayOfElements[i--] = tmp;
                i = (i == 0) ? j++ : i;
            }
        }

        return arrayOfElements;
    }
}

