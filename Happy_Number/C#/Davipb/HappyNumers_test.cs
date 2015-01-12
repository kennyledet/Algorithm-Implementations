using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Happy
{
	public static class HappyNumers_test
	{
		static void Main(string[] args)
		{
			do
			{
				Console.Clear();
				Test();
			}
			while (Console.ReadKey().Key != ConsoleKey.Escape);
		}

		public static void Test()
		{
			Console.WriteLine("Enter number");
			ulong numb = ulong.Parse(Console.ReadLine());

			if (HappyNumbers.IsHappy(numb))
				Console.WriteLine("{0} is happy! :)", numb);
			else
				Console.WriteLine("{0} is sad! :(", numb);
		}
	}
}
