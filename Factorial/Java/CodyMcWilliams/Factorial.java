public class Factorial {
//Over 20! and the numbers roll over
	static private long recursiveFact(long n) {
		assert n > -1;
		if (n < 1) {
			return 1;
		}
		return n * recursiveFact(n - 1);
	}

	static private long loopFact(long n) {
		assert n > -1;
		long i = n;
		while (--i > 0) {
			n *= i;
		}
		return n;
	}

	static public void printRecursive(int n) {
		for (int i = 0; i < n; i++) {
			System.out.print(i + "! = ");
			System.out.println(recursiveFact(i));
		}
	}

	static public void printLoop(int n) {
		for (int i = 0; i < n; i++) {
			System.out.print(i + "! = ");
			System.out.println(loopFact(i));
		}
	}
	
	public static void main(String[] args){
		printLoop(21);
		printRecursive(21);
	
	
	}
	

}
