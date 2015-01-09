using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Horspool
{
	public static class Horspool_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			Console.WriteLine("Enter haystack:");
			string haystack = Console.ReadLine();

			Console.WriteLine();

			Console.WriteLine("Enter needle:");
			string needle = Console.ReadLine();

			int match = BoyerMooreHorspool.Find(haystack, needle);

			Console.Clear();

			if (match == -1)
			{
				Console.WriteLine("No match");
				return;
			}

			Console.WriteLine("Match at char {0}", match);

			Console.WriteLine();
			Console.WriteLine(haystack);
			for (int i = 0; i < match; i++)
				Console.Write(" ");

			for (int i = 0; i < needle.Length; i++)
				Console.Write("^");
			
		}
	}
}
