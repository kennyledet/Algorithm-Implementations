/*
 * Written by: Rafael A. Rivera
 * Last Update: December 29, 2013
 */
public class MergeSort_test {

	public static void main(String[] args) {
		int[] array = {3921,12,32,1,5234,321,32134};
		
		System.out.println("Before sorting: ");
		for(int number : array){
			System.out.print(number + " ");
		}
		
		MergeSort.mergeSort(array, 0, 3);
		
		System.out.println("\n\nAfter Sorting first four elements: ");
		for(int number : array){
			System.out.print(number + " ");
		}
		
		MergeSort.mergeSort(array, 0, array.length-1);
		
		System.out.println("\n\nAfter sorting entire array: ");
		for(int number : array){
			System.out.print(number + " ");
		}
	}

}
