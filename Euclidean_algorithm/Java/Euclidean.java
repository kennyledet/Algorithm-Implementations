/*
 * @author Jared Halpert (ghostsnstuff)
 * @date 2/8/14
 * @description http://en.wikipedia.org/wiki/Euclidean_algorithm
 * @implementations division, subtraction, recursive
 */
public class Euclidean {

	int gcd_Division(int a, int b) {
		int temp = 0;
		while(b != 0) {
			temp = b;
			b = a % b;
			a = temp;
		}
		return a;
	}

	int gcd_Substraction(int a, int b) {
    while( a != b){
        if( a > b ){
            a -= b; 
        }else{
            b -= a;
        }
    }
    return a;
	}

	int gcd_Recursive(int a, int b){
    return (b == 0) ? a : gcd_Recursive(b, a % b);
	}

}