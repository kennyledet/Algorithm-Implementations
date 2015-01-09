using System;
using System.Collections.Generic;

namespace Roman
{

	public static class Program
	{

		static void Main(string[] args)
		{
			while (Console.ReadKey().Key != ConsoleKey.Escape)
			{
				SimpleConvert();
				SimpleDeconvert();
			}
		}

		static void SimpleConvert()
		{
			string input = "INVALID";
			long result = 0;

			while (!long.TryParse(input, out result))
			{
				Console.Clear();
				Console.WriteLine("Enter the number you wish to convert:");
				input = Console.ReadLine();
			}

			Console.WriteLine(Environment.NewLine + "RESULT:");
			Console.WriteLine(RomanConverter.ToRoman(result, true));
		}

		static void SimpleDeconvert()
		{
			Console.Clear();
			Console.WriteLine("Enter the roman number you wish to convert to decimal:");
			string input = Console.ReadLine();

			Console.WriteLine(Environment.NewLine + "RESULT:");
			Console.WriteLine(RomanConverter.ToDecimal(input).ToString());
		}
	}

}