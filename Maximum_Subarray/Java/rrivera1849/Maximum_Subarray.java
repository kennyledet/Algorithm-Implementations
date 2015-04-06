/*
 * Written by: Rafael A. Rivera
 * Last Updated: December 30, 2013
 */

public class Maximum_Subarray {
	
	/*
	 * Description:
	 * 		Finds a subarray with the maximum sum. We refer to it as "a subarray" because there might
	 * be others that have the same sum. We take a "divide and conquer" approach in which the array is
	 * divided in half and the individual subproblems are solved.  
	 * 
	 * Input:
	 * 		array:double - a sequence of numbers.
	 * 		low:int - index of the first element (inclusive).
	 * 		hight:int - index of the last element (inclusive).
	 * 
	 * Output:
	 * 		A tuple that consists of the following values (leftIndex, rightIndex, sum).
	 * 	In the tuple, leftIndex and rightIndex is the range of the subarray.
	 *
	 * Complexity:
	 * 		O(nlog(n))
	 */
	public static Tuple<Integer,Integer,Double> maxSubarray(double[] array, int low, int high){
		
		if(high == low){
			return new Tuple<Integer,Integer,Double>(low, high, array[low]);
			
		}else{
			int mid = (low+high)/2;
			
			Tuple<Integer,Integer,Double> maxLeft = maxSubarray(array,low,mid);
			Tuple<Integer,Integer,Double> maxRight = maxSubarray(array,mid+1,high);
			Tuple<Integer,Integer,Double> maxCross = maxCrossingSubarray(array,low,mid,high);
			
			if(maxLeft.getZ() >= maxRight.getZ() && maxLeft.getZ() >= maxCross.getZ()){
				return maxLeft;
			}else if(maxRight.getZ() >= maxRight.getZ() && maxRight.getZ() >= maxCross.getZ()){
				return maxRight;
			}else{
				return maxCross;
			}
		}
	}
	
	private static Tuple<Integer,Integer,Double> 
			maxCrossingSubarray(double[] array, int low, int mid, int high){
		
		int sum = 0;
		
		double leftSum = Double.NEGATIVE_INFINITY;
		int maxLeft = -1;
		
		for(int i = mid; i >= low; i--){
			sum += array[i];
			
			if(sum > leftSum){
				leftSum = sum;
				maxLeft = i;
			}
		}
		
		sum = 0;
		
		double rightSum = Double.NEGATIVE_INFINITY;
		int maxRight = -1;
		
		for(int j = mid + 1; j <= high; j++){
			sum += array[j];
			
			if(sum > rightSum){
				rightSum = sum;
				maxRight = j;
			}
		}
		
		Tuple<Integer,Integer,Double> result = new Tuple<>(maxLeft, maxRight, leftSum+rightSum);
		return result;
	}
}
