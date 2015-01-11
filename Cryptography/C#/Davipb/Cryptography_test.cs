using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crypto
{
	public static class Cryptography_test
	{
		static void Main(string[] args)
		{
			while (true)
			{
				Test();
				Console.ReadKey();
				Console.Clear();
			}
		}

		public static void Test()
		{
			Console.WriteLine("Enter your numbers, separated by ';'");
			long[] numbers = Console.ReadLine().Replace(" ", string.Empty).Split(';').Where(x => !string.IsNullOrWhiteSpace(x)).Select(x => long.Parse(x)).ToArray();

			Console.WriteLine();

			Console.WriteLine("Top secret TSA encryption:");
			Console.WriteLine(Cryptography.Encrypt(numbers));
		}
	}
}
