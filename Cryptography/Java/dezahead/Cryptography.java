/*TopCoder Security Agency (TSA, established today) has just invented a new encryption system! 
This encryption system takes as its input a list of numbers to encrypt.

You work at TSA and your task is to implement a very important part of the encryption process. 
You are allowed to pick one number in the input list and increment its value by 1. 
This should be done in such way that the product of all numbers in the list after this change becomes as large as possible.

Given the list of numbers as int[] numbers, return the maximum product you can obtain. 
It is guaranteed that the return value will not exceed 2^62.

See txt file for rest of spec.
*/

import javax.swing.JOptionPane;

public class Cryptography
{
	public static int input;

	//reads in the array of numbers from main
	public static long encrypt(int[] numbers) 
	{
		long max = 0;
		long product = 1;
		int location = input - 1;
		double maxReturn = Math.pow(2,62);//maximum value that the answer can be

		for (; location >= 0; location--)
		{
			numbers[location] += 1; //increments one number at a time
			

			for (int location2 = input - 1; location2 >= 0; location2--)
				product *= numbers[location2];//multiplies all the numbers
			
			if (product > max && product <= maxReturn)
				max = product;//checks to see if the the product is more than the current max

			product = 1;

			numbers[location] -= 1;	//decrements the number 	
		}

		return max;
	}

	public static void main(String[] args) 
	{

		long maxP;
		String temp;

		//checks to see how many numbers the user wants to enter
		temp = JOptionPane.showInputDialog(null, "How many numbers are you inputting?", "Input", JOptionPane.QUESTION_MESSAGE);
		input = Integer.parseInt(temp);

		//create array, size based on the number the user entered
		int[] numbers = new int[input];

		//has the user input each number
		for(int num = 0; num < input; num++)
		{
			temp = JOptionPane.showInputDialog(null, "Input number", "Number Entry", JOptionPane.QUESTION_MESSAGE);
			numbers[num] = Integer.parseInt(temp);
		}

		maxP = encrypt(numbers);//calls the encryption function

		//Outputs the largest product
		JOptionPane.showMessageDialog(null, "The max product is " + maxP, "Max", JOptionPane.INFORMATION_MESSAGE);
		
	}

}
