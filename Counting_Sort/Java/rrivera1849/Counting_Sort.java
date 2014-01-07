/*
 * Written by: Rafael A. Rivera Soto
 * Last Updated: January 7, 2014
 */
public class Counting_Sort {

	public static int[] countingSort(int[] array, int maxNumber){
		int[] sorted = new int[array.length];
		int[] workArray = new int[maxNumber + 1];
		
		/*
		 * Inspect every element in the array, if the value of the element is i
		 * then we increment workArray[i].
		 */
		for(int i = 0; i < array.length; i++)
			workArray[array[i]] += 1;
		
		workArray[0] -= 1;	// Subtract one because index begins at 0
		
		/*
		 * For each workArray[j] count how many elements are less than it. This
		 * determines the position of the element.
		 */
		for(int j = 1; j < workArray.length; j++)
			workArray[j] += workArray[j-1];
		
		// Insert the correct element in the array
		for(int z = array.length-1; z >= 0; z--){
			sorted[workArray[array[z]]] = array[z];
			workArray[array[z]] -= 1;
		}
		
		return sorted;
	}
	
}
