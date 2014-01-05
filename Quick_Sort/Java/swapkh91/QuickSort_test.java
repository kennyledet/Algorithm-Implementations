/*
 * Written by: Swapnesh Khare
 * Last Update: 4 January, 2014
 */
class QuickSort_test
{
	public static void main(String args[])
		{
			int a[] = {100, 1, 9, 59, 23, 101, 44, 27};
			
			QuickSort.quick(a, 0, n-1);
			for(int x = 0; x < a.length; x++)
	   			System.out.print(a[x]+ " ");
	}
}