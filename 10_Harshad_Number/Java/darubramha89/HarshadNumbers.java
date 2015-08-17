package harshad.number;

public class HarshadNumbers {

	public static boolean isHarshad(int input)
	{
		if(input <= 0)
        {
            System.out.println(input+" is invalid, enter a non-negative/non-zero number");
            return false;
        }
        if(input%decimalSum(input) == 0)
		{
			System.out.println(input+" is Harshad Number");
			return true;
		}
		else
		{
			System.out.println(input+" is not a Harshad Number");
			return false;
		}
			
	}
	
	public static int decimalSum(int input)
	{
		int sum = 0;
		while(input>0)
		{
			int temp = input%10;
			sum = sum + temp;
			input = input / 10;
		}
		return sum;
	}
	
}
