import java.util.Random;

public class Bogosort {
    public static int[] sort(int[] arr) {
        while (!isSorted(arr)) {
            fisher_yates(arr);
        }
        return arr;
    }

    private static boolean isSorted(int[] arr) {
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] < arr[i-1]) return false;
        }
        return true;
    }

    // Soley used for shuffling, not part of actual algorithm
    private static void fisher_yates(int[] arr) {
        Random rand = new Random();
        int m = arr.length;
        int tmp, i;

        while (m != 0) {
            i = rand.nextInt(m--);
            tmp = arr[m];
            arr[m] = arr[i];
            arr[i] = tmp;
        }
    }
}