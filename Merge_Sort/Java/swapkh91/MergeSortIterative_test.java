/*
 * Written by: Swapnesh Khare
 * Last Update: 4 January, 2014
 */
public class MergeSortIterative_test 
{
	public static void main(String args[]) 
	{
		int a[] = {1024,1,10,1111,4321,1029,101010};
		
		System.out.println("Before sorting: ");
		for(int number : a)
			System.out.print(number + " ");
		
		MergeSortIterative.mergeSort(a);
		
		System.out.println("\nAfter sorting: ");
		for(int number : a)
			System.out.print(number + " ");
	}

}
