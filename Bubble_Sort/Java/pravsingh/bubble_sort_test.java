package github_contributions;

import static org.junit.Assert.*;
import org.junit.Test;

/**
 * 
 * @author pravsingh
 * 
 *         Junit test cases around bubble sort.
 * 
 */
public class bubble_sort_unittest {

	@Test
	public void testHappyPath() {

		int data[] = { 1, 3, 2 };
		bubble_sort.bubbleSort(data);

		assertEquals(data[0], 1);
		assertEquals(data[1], 2);
		assertEquals(data[2], 3);
	}

	@Test
	public void testEmptyArray() {

		int data[] = {};
		bubble_sort.bubbleSort(data);

		assertEquals(data.length, 0);
	}

}
