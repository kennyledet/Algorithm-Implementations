
import org.junit.Assert.*;
import org.junit.Test;

import static org.junit.Assert.assertArrayEquals;

public class BozoSortTest {

    @Test
    public void TestBozoSort() {

        int[] inputArray = {11, 44, 22, 7, 9, 0, 34};

        BozoSort objectForBozoSort = new BozoSort();
        int[] sortedArray = objectForBozoSort.bozoSort(inputArray);

        assertArrayEquals(inputArray,sortedArray);
    }


}

