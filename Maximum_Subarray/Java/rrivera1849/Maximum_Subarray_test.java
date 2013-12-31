import org.junit.Assert;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;


import org.junit.Test;

@RunWith(JUnit4.class)
public class Maximum_Subarray_test extends Maximum_Subarray{

	@Test
	public void test() {
		double[] testArray = {13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7};
		String correctResult = "(7,10,43.0)";
		String result = maxSubarray(testArray,0,testArray.length-1).toString();
		
		String errorMessage = "Error, correct result is (7,10,43.0), instead got " + result;
		
		Assert.assertEquals(errorMessage,correctResult,result);
		
		double[] testArray2 = {1,2,3,4,5};
		correctResult = "(0,4,15.0)";
		result = maxSubarray(testArray2,0,testArray2.length-1).toString();
		
		Assert.assertEquals(errorMessage,correctResult,result);
	}

}
