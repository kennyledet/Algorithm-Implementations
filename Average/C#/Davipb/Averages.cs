using System;
using System.Collections.Generic;
using System.Linq;

namespace Average
{
	public static class Averages
	{
		public static double ArithmeticMean(params double[] numbers)
		{
			return numbers.Average(); // That was easy
		}

		public static double WeightedMean(double[] numbers, double[] weights)
		{
			double weightedSum = 0;

			for (int i = 0; i < numbers.Length; i++)
				weightedSum += numbers[i] * weights[i];

			return weightedSum / weights.Sum();
		}

		public static double HarmonicMean(params double[] numbers)
		{
			return 1.0 / ArithmeticMean(numbers.Select(x => 1.0 / x).ToArray());
		}

		public static double GeometricMean(params double[] numbers)
		{
			double product = numbers[0];

			for (int i = 1; i < numbers.Length; i++)
				product *= numbers[i];

			return Math.Pow(product, 1.0 / (double)numbers.Length);
		}

		public static double QuadraticMean(params double[] numbers)
		{
			return GeneralizedMean(2.0, numbers);
		}

		public static double GeneralizedMean(double power, params double[] numbers)
		{
			return Math.Pow(
				ArithmeticMean(numbers.Select(x => Math.Pow(x, power)).ToArray()), 
				1.0 / power);
		}

		public static double Midrange(params double[] numbers)
		{
			return ArithmeticMean(numbers.Min(), numbers.Max());
		}

		public static double Median(params double[] numbers)
		{
			if (numbers.Length % 2 == 0)
				return ArithmeticMean(numbers[(numbers.Length / 2) - 1], numbers[numbers.Length / 2]);
			else
				return numbers[((numbers.Length + 1) / 2) - 1];
		}

		public static double Mode(params double[] numbers)
		{
			Dictionary<double, int> frequencies = new Dictionary<double, int>();

			foreach (double d in numbers)
				if (frequencies.Keys.Contains(d))
					frequencies[d]++;
				else
					frequencies.Add(d, 1);

			double biggest = numbers[0];

			for (int i = 1; i < numbers.Length; i++)
				if (frequencies[numbers[i]] > frequencies[biggest])
					biggest = numbers[i];

			return biggest;
		}
	}
}
