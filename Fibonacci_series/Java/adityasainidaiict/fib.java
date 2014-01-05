Implementation of fibonacci using memoization.
// Defining fibcache to store the fibonacci numbers.
//It is an array list of biginteger. 
private static ArrayList<BigInteger> fibCache = new ArrayList<BigInteger>();
static {
      fibCache.add(BigInteger.ZERO);
      fibCache.add(BigInteger.ONE);
}
import java.math.BigInteger;
import java.util.ArrayList;
// If the found number is already in the cache it will return that 
//number else it will calculate and store that number in cache.
public class FibonacciMemoized {
        

       public static BigInteger fib(int n) {
              if (n >= fibCache.size()) {
                  fibCache.add(n, fib(n-1).add(fib(n-2)));
              }
              return fibCache.get(n);
       }

}