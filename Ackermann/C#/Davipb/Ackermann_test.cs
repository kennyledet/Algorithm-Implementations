using System;

namespace Ackermann
{
	public static class Ackermann_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		static void Test()
		{
			ulong m = 0;
			ulong n = 0;

			Console.WriteLine("Value of Ackermann(m, n)");

			Console.Write("m = ");
			m = ulong.Parse(Console.ReadLine());

			Console.Write("n = ");
			n = ulong.Parse(Console.ReadLine());

			Console.WriteLine();
			Console.WriteLine("Ackermann({0}, {1}) = {2}", m, n, AckermannClass.Ackermann(m, n));
		}
	}
}
