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
module.exports = function(array) {
	var swapped;
	do {
		for(var i = 0; i < array.length - 2; i++) {
			if(array[i] > array[i+1]) {
				var temp = array[i];
				array[i] = array[i+1];
				array[i+1] = temp;
				swapped = true;
			}
		}	
		if(!swapped) {
			break;
		}
		swapped = false;
		for(var i = array.length - 2; i > 0; i--) {
			if(array[i] > array[i+1]) {
				var temp = array[i];
				array[i] = array[i+1];
				array[i+1] = temp;
				swapped = true;
			}
		}
	} while(swapped);
}