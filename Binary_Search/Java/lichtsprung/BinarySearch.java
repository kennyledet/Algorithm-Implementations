import java.util.Arrays;

public class BinarySearch {
    public static int search(int[] values, int target) {
        if (values.length < 1) {
            return -1;
        }

        int mid = values.length / 2;
        int midValue = values[mid];

        if (midValue > target) {
            return search(Arrays.copyOfRange(values, 0, mid), target);
        } else if (midValue < target) {
            int p = search(Arrays.copyOfRange(values, mid + 1, values.length), target);
            return (p < 0) ? -1 : mid + 1 + p;
        }
        return mid;
    }
}
