import org.junit.Test;
import static org.junit.Assert.*;

public class LinearSearchTest {
    LinearSearch linearSearch;
    
    public LinearSearchTest() {
        linearSearch = new LinearSearch();
    }
    
    @Test
    public void searchIntKeyTest() {
        int numbers[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        System.out.println("Search for keys that exist in the array.");
        assertTrue(linearSearch.search(numbers, 9));
        assertTrue(linearSearch.search(numbers, 1));
        assertTrue(linearSearch.search(numbers, 5));
        assertTrue(linearSearch.search(numbers, 10));
        assertTrue(linearSearch.search(numbers, 4));
        
        System.out.println("Search for keys that do not exist in the array.");
        assertFalse(linearSearch.search(numbers, 0));
        assertFalse(linearSearch.search(numbers, 20));
        assertFalse(linearSearch.search(numbers, 100));
        assertFalse(linearSearch.search(numbers, -70));
        assertFalse(linearSearch.search(numbers, 11));
    }    
}
