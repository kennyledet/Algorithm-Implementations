import static org.junit.Assert.*;
import org.junit.Test;

public class GenomeSortTest {

    @Test
    public void TestGenomeSort() {

        int testArray[] = {8, 7, 6, 5, 4, 3, 2, 1};
        int checkArray[] = {1, 2, 3, 4, 5, 6, 7, 8};

        GenomeSort objectForGenomeSort = new GenomeSort();
        int resultArray[] = objectForGenomeSort.genomeSort(testArray);

        assertArrayEquals(checkArray,resultArray);
    }
}

