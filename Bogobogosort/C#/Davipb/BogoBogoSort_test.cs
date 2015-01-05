using System;
using System.Linq;

namespace BogoBogoSort
{
	public static class BogoBogoSort_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		static void Test()
		{
			Console.WriteLine("Enter the list you want to sort, separated by ';':");

			double[] numbers = Console.ReadLine().Replace(" ", string.Empty).Split(';').Where(x => !string.IsNullOrWhiteSpace(x)).Select(x => double.Parse(x)).ToArray();
			numbers = BogoBogoSort.Sort(numbers);			

			for (int i = 0; i < numbers.Length; i++)
				Console.WriteLine("{0} - {1}", i, numbers[i]);
		}
	}
}
