using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FactorialName
{
	public static class Factorial_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			Console.WriteLine("Enter number:");
			ulong FactorialVar = ulong.Parse(Console.ReadLine());

			Console.WriteLine();

			Console.WriteLine("{0}! = {1}", FactorialVar, FactorialClass.Factorial(FactorialVar));
		}
	}
}
