package collatz.chain;

public class CollatzChain {

	static int stoppingTime = 0;
	
	public void collatz(int n) {
		stoppingTime++;
        System.out.print(n+" ");
        if(n < 0){
        	System.out.println("Please enter positive integers");
        	return;
        }
        if (n == 1){
        	System.out.println("\nStopping Time : "+stoppingTime);
        	stoppingTime = 0;
        	return;
        }
        else if (n % 2 == 0) collatz(n / 2);
        else collatz(3*n + 1);
    }
}
