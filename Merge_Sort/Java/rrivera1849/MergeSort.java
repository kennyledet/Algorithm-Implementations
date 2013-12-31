/*
 * Written by: Rafael A. Rivera
 * Last Update: December 29, 2013
 */
public class MergeSort {
	
	/*
	 * Inputs:
	 * 		array - An array containing a sequence of integers.
	 * 		start / end - The range that you want to sort.
	 * 
	 * Output:
	 * 		Although the function is void the original array will be sorted in the specified range.
	 */
	
	public static void mergeSort(int[] array, int start, int end){
		if (start < end){
			int middle = (end + start) / 2;
			mergeSort(array, start, middle);
			mergeSort(array, middle + 1, end);
			
			merge(array,start,middle,end);
		}
	}
	
	private static void merge(int[]array, int start, int middle, int end){
		int size_1 = middle - start + 1;
		int size_2 = end - middle;
		
		int[] leftArray = new int[size_1];
		int[] rightArray = new int[size_2];
		
		for(int i = 0; i < size_1; i++){
			leftArray[i] = array[start + i];
		}
		
		for(int j = 0; j < size_2; j++){
			rightArray[j] = array[j + middle + 1];
		}
		
		int i = 0;
		int j = 0;
		
		for(int k = start; k <= end; k++){
			if(i == size_1){
				array[k] = rightArray[j];
				j++;
				continue;
			}
			
			if(j == size_2){
				array[k] = leftArray[i];
				i++;
				continue;
			}
			
			if(leftArray[i] <= rightArray[j]){
				array[k] = leftArray[i];
				i++;
			}else{
				array[k] = rightArray[j];
				j++;
			}
		}
		
	}
}
