namespace FactorialName
{
	public static class FactorialClass
	{
		/// <summary>
		/// Gets the factorial value of numb
		/// </summary>
		/// <param name="numb">The number to get the factorial</param>
		/// <returns>Factorial of numb</returns>
		public static ulong Factorial(ulong numb)
		{
			if (numb == 1UL)
				return 1;
			return numb * Factorial(numb - 1);
		}
	}
}
