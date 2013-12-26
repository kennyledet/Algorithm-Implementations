package github_contributions;

import static org.junit.Assert.*;
import org.junit.Test;

/**
 * 
 * @author pravsingh
 * 
 *         Junit test cases around shell sort.
 * 
 */
public class shell_sort_unittest {

	@Test
	public void testHappyPath() {

		int data[] = { 1, 3, 2 };
		shell_sort.shellSort(data);

		assertEquals(data[0], 1);
		assertEquals(data[1], 2);
		assertEquals(data[2], 3);
	}

	@Test
	public void testEmptyArray() {

		int data[] = {};
		shell_sort.shellSort(data);

		assertEquals(data.length, 0);
	}

}

