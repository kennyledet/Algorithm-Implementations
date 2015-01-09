using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fib
{
	public static class Fibonacci_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			foreach (var numb in Fibonacci.Sequence())
			{
				Console.WriteLine(numb);

				if (Console.ReadKey(true).Key == ConsoleKey.Escape)
					break;
			}
		}
	}
}
