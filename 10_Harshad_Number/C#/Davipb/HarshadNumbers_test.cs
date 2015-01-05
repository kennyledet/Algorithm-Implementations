using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HarshadNumbers
{
	public static class HarshadNumbers_test
	{
		public static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			Console.Title = "HarshadNumbers unit test";

			Console.WriteLine("Is N a 10-Harshad number?");
			Console.Write("N = ");
			Console.WriteLine(HarshadNumbers.IsHarshad(ulong.Parse(Console.ReadLine())).ToString());

			Console.WriteLine();

			Console.WriteLine("Get the first N 10-Harshad Numbers");
			Console.Write("N = ");

			int max = int.Parse(Console.ReadLine());
			for (int i = 0; i < max; i++)
				Console.WriteLine("{0}: {1}", i, HarshadNumbers.AllHarshadNumbers().ElementAt(i));
		}
	}
}
