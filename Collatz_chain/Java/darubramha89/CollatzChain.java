package collatz.chain;

public class CollatzChain {

	public void collatz(int n) {
        System.out.print(n+" ");
        if (n == 1) 
        {
        	System.out.println();
        	return;
        }
        else if (n % 2 == 0) collatz(n / 2);
        else collatz(3*n + 1);
    }
}
