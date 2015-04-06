using System;
using System.Diagnostics;

namespace ROT
{
	public static class ROT13_test
	{
		
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}


		public static void Test()
		{
			Console.WriteLine("Enter your text:");
			string input = Console.ReadLine();

			Console.WriteLine();

			Console.WriteLine("Result: ");
			Console.WriteLine(ROT13.Transform(input));
		}
	}
}
