using System;
using System.Linq;

namespace Average
{
	public static class Averages_test
	{

		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		static void Test()
		{
			Console.WriteLine("Enter a sequence, separated by ';'");

			double[] numbers = Console.ReadLine().Replace(" ", string.Empty).Split(';').Where(x => !string.IsNullOrWhiteSpace(x)).Select(x => double.Parse(x)).ToArray();

			Console.WriteLine();
			Console.Write("Sequence: ");
			foreach (double n in numbers)
				Console.Write(n.ToString() + "; ");
			Console.WriteLine();
			Console.WriteLine();

			Console.WriteLine("Arithmethic Mean: {0}", Averages.ArithmeticMean(numbers));
			Console.WriteLine("Harmonic Mean: {0}", Averages.HarmonicMean(numbers));
			Console.WriteLine("Geometric Mean: {0}", Averages.GeometricMean(numbers));
			Console.WriteLine("Quadratic Mean: {0}", Averages.QuadraticMean(numbers));
			Console.WriteLine("Midrange: {0}", Averages.Midrange(numbers));
			Console.WriteLine("Median: {0}", Averages.Median(numbers));
			Console.WriteLine("Mode: {0}", Averages.Mode(numbers));

			Console.WriteLine();

			Console.WriteLine("Generalized mean with power N");
			Console.Write("N = ");
			Console.WriteLine(Averages.GeneralizedMean(double.Parse(Console.ReadLine()), numbers));

			Console.WriteLine();

			Console.WriteLine("Weighted mean with weights:");
			Console.WriteLine(Averages.WeightedMean(numbers, Console.ReadLine().Replace(" ", string.Empty).Split(';').Where(x => !string.IsNullOrWhiteSpace(x)).Select(x => double.Parse(x)).ToArray()));
		}
	}
}
