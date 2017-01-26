/* Recursive solution for detecting if a string is a palindrome
 * Author: Kendrick Ledet 2016 * kennyvledet@gmail.com
 */

public class Palindrome {

	public static boolean detect(String word) {
		// word gets whittled down to 1 char,
		// unless first and last characters don't match.
		// if it makes it, it's considered a palindrome
		if (word.length() <= 1)
			return true;

		if (word.charAt(0) != word.charAt(word.length()-1))
			return false;
		else
			return detect(word.substring(1, word.length()-1));
	}

	public static void main(String[] args) {
		// Test client
		System.out.println(detect("test"));  // false
		System.out.println(detect("lel"));  // true
		System.out.println(detect("hahhah"));  // true

		if (! detect("lel") )
			throw new AssertionError();
		if (! detect("hahhah") )
			throw new AssertionError();
		if ( detect("test") )
			throw new AssertionError();
	}
}