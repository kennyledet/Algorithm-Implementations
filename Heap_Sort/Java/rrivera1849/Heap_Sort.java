/*
 * Written by: Rafael A. Rivera Soto
 * Last Updated: January 2, 2014
 */
public class Heap_Sort {
	/*
	 * Description:
	 * 		Represents the array as a heap in order to effectively sort it. Uses functions
	 * implemented in the heap class in order to build the heap as a "max heap" and then 
	 * sort.
	 * 
	 * Input:
	 * 		array:int - sequence to sort
	 * 
	 * Output:
	 * 		A sorted array.
	 * 
	 * Complexity:
	 * 		O(nln(n))
	 */
	public static int[] heapSort(int[] array){
		Heap arrayHeap = new Heap (array);
		
		for(int i = arrayHeap.size - 1; i > 0; i--){
			arrayHeap.swap(i, 0);
			arrayHeap.size -= 1;
			arrayHeap.maxHeapify(0);
		}
		
		return arrayHeap.getArray();
	}
}
