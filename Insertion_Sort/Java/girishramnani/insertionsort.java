

import java.io.IOException;
import java.util.Scanner;


/**
*
* @author girish ramnani
**/
public class insertionsort {

	public static void main(String[] args) throws NumberFormatException,
			IOException {

		Scanner x = new Scanner(System.in);
		int iter = x.nextInt();
		int[] num = new int[iter];
		for (int i = 0; i < iter; i++) {
			num[i] = x.nextInt();

		}
		sort(num);
}

public static void sort(int[] num){

		int counter = 0;
		int i = 0, j = 0;

		for (; i < num.length; i++) {
			for (j = i; j > 0; j--) {
				if (num[j] < num[j - 1]) {
					int temp = num[j];
					num[j] = num[j - 1];
					num[j - 1] = temp;
					counter++;
				}

			}

		}
	System.out.println("The Sorted list is :");
	for (int value : num ) {
		System.out.print(value +" ");
	}
		

	}

}
