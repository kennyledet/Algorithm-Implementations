/*
 * Written by: Swapnesh Khare
 * Last Update: 10 September, 2013

 * Worst Case: input array is already sorted or the pivot is either the smallest or the largest element
 * Best Run time: n*log(n)
 * Worst Run Time: n^2
*/

public class QuickSort 
{
	static void quick(int a[], int l, int h)
	{
		int i = l;
		int j = h;
		int pivot = a[(l+h)/2]; 	// using the middle element as the pivot
		
		while(i <= j)
		{
			while(a[i] < pivot) // moving right when the current element is less than the pivot
				i++;
			
			while(a[j] > pivot)	// moving left when the current element is greater than the pivot
				j--;
			
			if(i <= j)	// exchange the elements
			{
				int temp = a[i];
				a[i] = a[j];
				a[j] = temp;
				i++;
				j--;
			}
			
			if(l < j)
				quick(a, l, j);
			if(i < h)
				quick(a, i, h);
		}
	}
}
