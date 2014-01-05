import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;

import java.util.Arrays;

public class Heap_Sort_test extends Heap_Sort{

	@Test
	public void test() {
		int[] unsorted = {38,32,13,45,-32,-123,0};
		int[] sorted = {-123,-32,0,13,32,38,45};
		int[] result = heapSort(unsorted);
		
		String errorMsg = String.format("Error - expected %s got %s",Arrays.toString(sorted),
				Arrays.toString(result));
		
		Assert.assertArrayEquals(errorMsg, sorted, result);
	}

}
