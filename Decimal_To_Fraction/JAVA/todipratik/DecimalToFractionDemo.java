/**
	@author Pratik Todi
**/
class DecimalToFractionDemo {
	public static void main(String args[]) {
		System.out.println(new DecimalToFraction(-1.2345250)); // fractional equivalent is -49381/40000
		System.out.println(new DecimalToFraction(-0)); // fractional equivalent is 0/1
		System.out.println(new DecimalToFraction(1.343)); // fractional equivalent is 1343/1000
	}
}
