package happy.number;

public class HappyNumber {

	public int sumOfSquares(int n)
	{
//		System.out.print(n);
		int sum = 0;
		while(n > 0)
		{
			int temp = n%10;
			sum = sum + (int)Math.pow(temp, 2);
			n = n/10;
		}
		// System.out.println(" > "+sum);
		return sum;
	}
	
	public boolean isHappyNumber(int input)
	{
		if(input < 0)
			return false;
		while(input > 1 && input!=4)
			input = sumOfSquares(input);
		if(input==1)
			return true;
		else
			return false;
	}
}
