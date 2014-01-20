public class Factorial {
    
	public static void main(String[] args) {
		findFactorial();
	}
    
	public static void findFactorial() {
        
		long a = 5; // The number whose factorial has to be calculated.
		long result = a;
		long c = 1;
        
		if (a > 0) {
			while (c <= a - 1) {
				long b = (a - c);
				result *= b;
				c++;
                
			}
			System.out.println("The factorial of " + a + " is " + result);
		} else {
			if (a == 0) {
				System.out.println("The factorial of 0 is 1");
			} else {
				System.out.println("The number is less than 0");
			}
            
		}
        
	}
    
}
