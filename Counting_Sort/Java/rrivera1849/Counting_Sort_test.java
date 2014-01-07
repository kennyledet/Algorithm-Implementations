import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;

import java.util.Arrays;

public class Counting_Sort_test extends Counting_Sort {

	@Test
	public void test() {
		int[] arrayToSort = {9,9,3,3,2,1,5,4,4,7,7};
		int[] expectedArray = {1,2,3,3,4,4,5,7,7,9,9};
		int[] sortedArray = countingSort(arrayToSort,9);
	
		String errorMsg = String.format("Error- got %s, expected %s"
				,Arrays.toString(expectedArray),Arrays.toString(sortedArray));
		
		Assert.assertArrayEquals(expectedArray,sortedArray);
	}

}
