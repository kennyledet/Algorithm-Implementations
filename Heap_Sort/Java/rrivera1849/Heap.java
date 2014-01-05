/*
 * Written by: Rafael A. Rivera Soto
 * Last Updated: January 2, 2014
 * 
 * This class only contains the necessary methods needed to build a maxHeap and sort
 * our array. It is in no way representative of a real heap implementation.
 */
public class Heap {
	int [] array;
	int size;
	
	public Heap(int[] array) {
		this.array = array;
		this.size = array.length;
		buildMaxHeap();
	}
	
	public int leftIndex(int i){
		return 2*i + 1;
	}
	
	public int rightIndex(int i){
		return 2*i + 2;
	}
	
	public void swap(int index1, int index2){
		int temp = array[index1];
		array[index1] = array[index2];
		array[index2] = temp;
	}
	
	public void maxHeapify(int i){
		int l = leftIndex(i);
		int r = rightIndex(i);
		int largest;
		
		if(l < size && array[l] > array[i]){
			largest = l;
		}else{
			largest = i;
		}
		
		if(r < size && array[r] > array[largest]){
			largest = r;
		}
		
		if(largest != i){
			swap(i,largest);
			maxHeapify(largest);
		}
	}
	
	public void buildMaxHeap(){
		for(int i = size/2 - 1; i >= 0; i--){
			maxHeapify(i);
		}
	}
	
	public int[] getArray(){
		return array;
	}
}
