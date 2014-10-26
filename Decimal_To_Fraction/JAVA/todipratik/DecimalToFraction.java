/**
	@author Pratik Todi
**/
public class DecimalToFraction {

	private long numerator;
	private long denominator;

	public DecimalToFraction(double decimal) {
		String string = Double.toString(decimal);
		String[] fraction = string.split("\\.");
		numerator = Long.parseLong(fraction[0] + "" + fraction[1]); // combine the pre-decimal and post-decimal digits to get numerator
		denominator = (long) Math.pow(10, fraction[1].length()); // ten is raised to power of number of digits after decimal to get
									 // denominator

		// bring the fraction into lowest form
		long gcd = greatestCommonDivisor(numerator, denominator);
		if (gcd > 0) {
			numerator /= gcd;
			denominator /= gcd;
		}
		
	}

	long greatestCommonDivisor(long num1, long num2) {
		// base case
		if (num2 == 0) {
			return num1;
		}
		return greatestCommonDivisor(num2, num1 % num2);
	}

	public String toString() {
		return numerator + "/" + denominator;
	}
}
