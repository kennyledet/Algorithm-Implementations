namespace Ackermann
{
	public static class AckermannClass
	{
		public static ulong Ackermann(ulong m, ulong n)
		{
			if (m == 0)
				return n + 1;
			else
				if (n == 0)
					return Ackermann(m - 1, 1);
				else
					return Ackermann(m - 1, Ackermann(m, n - 1));
		}
	}
}
