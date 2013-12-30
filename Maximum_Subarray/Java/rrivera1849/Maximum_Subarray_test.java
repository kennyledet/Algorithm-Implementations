
public class Maximum_Subarray_test extends Maximum_Subarray {
	public static void main (String [] args){
		
		double testArray[] = {13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7};
		double testArray2[] = {1,2,3,4,5,6,7};
		
		System.out.println("In the following array the maximum subarray is "
				+ "bounded from index 7-10");
		
		for(double number: testArray){
			System.out.print(number + " ");
		}
		
		System.out.println("\n\nOur algorithm calculates: " + maxSubarray(testArray,0,testArray.length-1));
		
		System.out.println("\nThe following array contains only positive numbers therefore "
				+ "the maximum subarray is the complete array itself");
		
		for(double number: testArray2){
			System.out.print(number + " ");
		}
		
		System.out.println("\n\nOur algorithm calculates: " + maxSubarray(testArray2,0,testArray2.length-1));
	}
}
