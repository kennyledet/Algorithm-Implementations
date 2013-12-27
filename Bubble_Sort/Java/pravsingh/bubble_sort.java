package github_contributions;

/**
 * 
 * @author pravsingh
 * 
 */
public class bubble_sort {

	/**
	 * Sorts an integer array in ascending order.
	 * 
	 * @param data
	 *            - reference to the integer array to sort, must not be null
	 *            Postcondition: The array is sorted in ascending order.
	 */
	public static void bubbleSort(int[] data) {

		for (int k = 0; k < data.length - 1; k++) {
			boolean isSorted = true;

			for (int i = 1; i < data.length - k; i++) {
				if (data[i] < data[i - 1]) {
					int tempVariable = data[i];
					data[i] = data[i - 1];
					data[i - 1] = tempVariable;

					isSorted = false;

				}
			}

			if (isSorted)
				break;
		}
	}

}
