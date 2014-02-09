/*
 * test file
 * test division, recursive, and subtraction implementations
 * expected output = 14 for each implementation
 */
public class Euclidean_Test {

	public static void main(String[] args) {
		Euclidean e = new Euclidean();
		System.out.print("gcd_Division(28, 14)     = ");
		System.out.println(e.gcd_Division(28, 14));
		System.out.print("gcd_Recursive(28, 14)    = ");
		System.out.println(e.gcd_Recursive(28, 14));
		System.out.print("gcd_Substraction(28, 14) = ");
		System.out.println(e.gcd_Substraction(28, 14));
	}

}