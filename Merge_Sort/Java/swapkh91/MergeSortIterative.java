/*
 * Written by: Swapnesh Khare
 * Last Update: 10 September, 2013

 * Worst Case: input array is in decreasing oreder
 * Run time: n*log(n)
*/
public class mergeI 
{
	/*
	 * Inputs:
	 * 		array - An array containing a sequence of integers.
	 * Output:
	 * 		the original array in sorted form.
	 */
	void mergeSort(int a[]) 
	{
		if(a.length < 2) 	//already sorted
			return;
		int diff = 1;		//to form groups of 2,4..etc to merge
		int startLeft, startRight;

		while(diff < a.length) 
		{
		 startLeft = 0;
			startRight = diff;
			while(startRight + diff <= a.length) // merge till right half is formed 
			{
				merge(a, startLeft, startLeft + diff, startRight, startRight + diff);

			 startLeft = startRight + diff;
				startRight = startLeft + diff;
			}
			if(startRight < a.length) 	// merge rest of the right part
				merge(a, startLeft, startLeft + diff, startRight, a.length);
			
			diff *= 2; 	//increase the group size 2 times
		}
	}

	void merge(int a[], int startLeft, int endLeft, int startRight, int endRight) 
	{
		// temporary arrays
		int right[] = new int[endRight - startRight + 1];
		int left[] = new int[endLeft - startLeft + 1];

		for(int i = 0, j = startRight; i < (right.length - 1); i++, j++) 
			right[i] = a[j];
		for(int i = 0, j = startLeft; i < (left.length - 1); i++, j++) 
			left[i] = a[j];

		// end points(sentinel values)
		right[right.length-1] = Integer.MAX_VALUE;
		left[left.length-1] = Integer.MAX_VALUE;

		for(int i = startLeft, j = 0,  k= 0; i < endRight; i++) 
		{
			if(left[j] <= right[k]) 
			{
				a[i] = left[j];
				j++;
			}
			else 
			{
				a[i] = right[k];
				k++;
			}
		}
	}

}