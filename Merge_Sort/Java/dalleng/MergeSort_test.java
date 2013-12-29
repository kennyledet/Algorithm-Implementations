import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.junit.Assert;

import java.util.Arrays;

@RunWith(JUnit4.class)
public class MergeSort_test {

    @Test
    public void simpleSort() {
        int[] unsorted = {9, 8, 7, 6, 5, 4, 3, 2, 1};
        int[] sorted = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int[] result = MergeSort.sort(unsorted);
        String errorMsg = String.format("Failure - expected %s got %s", Arrays.toString(sorted), Arrays.toString(result));
        Assert.assertArrayEquals(errorMsg, sorted, result);
    }

}
