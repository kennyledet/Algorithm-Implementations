public class Factorial {

	private long recursiveFact(long n) {
		assert n > -1;
		if (n < 1) {
			return 1;
		}
		return n * recursiveFact(n - 1);
	}

	private long loopFact(long n) {
		assert n > -1;
		long i = n;
		while (--i > 0) {
			n *= i;
		}
		return n;
	}

	public void printRecursive(int n) {
		for (int i = 0; i < n; i++) {
			System.out.print(i + "! = ");
			System.out.println(recursiveFact(i));
		}

	}

	public void printLoop(int n) {
		for (int i = 0; i < n; i++) {
			System.out.print(i + "! = ");
			System.out.println(loopFact(i));
		}

	}

}
