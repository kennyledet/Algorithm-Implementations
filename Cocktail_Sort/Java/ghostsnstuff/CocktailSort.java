/*
 * Cocktail Sort (bidirectional bubble sort)
 * @author ghostsnstuff
 * O(n^2) worst case 
 * O(n^2) average case 
 * O(n) best case 
 * the first for loop is for iterating up the list
 * the second for loop is for iterating down the list
 * for each iteration the current node is compared to the next node 
 * if the current node is bigger the next node -> the elements are swapped
 * this proccess continues until the list is sorted (i.e. swapped == false after first loop)
 */
public class CocktailSort {

	void Sort(int[] a){
		boolean swapped;
		do {
			swapped = false;
			for (int i = 0; i <= a.length - 2; i++) {
				if (a[i] > a[i+1]) {
					int temp = a[i];
					a[i] = a[i+1];
					a[i+1] = temp;
					swapped = true;
				}
			}
			if (!swapped) {
				break;
			}
			swapped = false;
			for (int i = a.length - 2; i >= 0; i--) {
				if (a[i] > a[i+1]) {
					int temp = a[i];
					a[i] = a[i+1];
					a[i+1] = temp;
					swapped = true;
				}
			}
		} while (swapped);
	}

}
