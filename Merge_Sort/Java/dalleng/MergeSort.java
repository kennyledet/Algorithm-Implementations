
public class MergeSort {
	
	static public void main(String[] args) {		
		int[] unsorted = {10, 9, 8, 7, 6, 4, 5, 2, 3, 1};
		int[] sorted = mergeSort(unsorted);
		
		for (int i : sorted) {
			System.out.println(i);
		}
	}
	
	static int[] mergeSort(int[] array) {
		if (array.length == 1) {
			return array;
		} else {
			int[] firstHalf = new int[array.length / 2];
			System.arraycopy(array, 0, firstHalf, 0, array.length / 2);
			firstHalf = mergeSort(firstHalf);
			
			int[] secondHalf = new int[array.length - firstHalf.length];
			System.arraycopy(array, firstHalf.length, secondHalf, 0, array.length - firstHalf.length);
			secondHalf = mergeSort(secondHalf);
			
			return merge(firstHalf, secondHalf);
		}
	}
	
	static int[] merge(int[] firstHalf, int[] secondHalf) {
		int newLength = firstHalf.length + secondHalf.length;
		int[] merged = new int[newLength];
		
		int j = 0;
		int k = 0;
		
		for (int i = 0; i < merged.length; i++) {
			if (j == firstHalf.length) {
				merged[i] = secondHalf[k];
				k++;
				continue;
			}
			
			if (k == secondHalf.length) {
				merged[i] = firstHalf[j];
				j++;
				continue;
			}
			
			if (firstHalf[j] > secondHalf[k]) {
				merged[i] = secondHalf[k];
				k++;
			} else {
				merged[i] = firstHalf[j];
				j++;
			}
		}
		
		return merged;
	}

}
