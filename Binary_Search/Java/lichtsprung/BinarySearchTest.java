import junit.framework.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;


@RunWith(JUnit4.class)
public class BinarySearchTest {
    int[] values = {1, 3, 5, 9, 17};
    int expectedPosition = 3;
    int target = 9;

    @Test
    public void shouldFindANumber() {
        int result = BinarySearch.search(values, target);
        Assert.assertEquals(expectedPosition, result);
    }

    @Test
    public void shouldFindNothing() {
        int result = BinarySearch.search(values, 19);
        Assert.assertEquals(-1, result);
    }

}
