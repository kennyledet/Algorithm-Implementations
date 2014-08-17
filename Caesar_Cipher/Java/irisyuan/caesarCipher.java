import java.util.Scanner;
 
public class caesarCipher {
 
	// cipher(String,int) returns original message shifted by 3 letters
	// if input is numerical, adds 3 to number
	public static char[] cipher(String message, int shift) {
		
		// declare variables
		String s = message;
		// convert string to array of chars
		char[] letters = message.toCharArray();
		
		for(int i = 0; i < message.length(); i++){
	       letters[i] += 3;
		}
		return letters;
	}
	
	// main method takes user input and calls cipher
	public static void main(String[] args) {
	
		Scanner input = new Scanner(System.in);
		System.out.println("Plaintext: ");
		String message = input.nextLine();
		 
		System.out.println("Ciphertext:");
		System.out.println(cipher(message, 3));
	}
 
}
