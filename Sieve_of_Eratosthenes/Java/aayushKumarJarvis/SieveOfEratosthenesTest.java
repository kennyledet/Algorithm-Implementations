
import org.junit.Test;
import java.util.Stack;
import static org.junit.Assert.*;

public class SieveOfEratosthenesTest {

    @Test
    public void TestSieveOfEratosthenes() {
        SieveOfEratosthenes objectForSieve = new SieveOfEratosthenes();

         Stack stackOfPrimes = objectForSieve.generatePrimeNumbers(20);

         assertEquals(stackOfPrimes.pop(),19);
         assertEquals(stackOfPrimes.pop(),17);
         assertEquals(stackOfPrimes.pop(),13);
         assertEquals(stackOfPrimes.pop(),11);
         assertEquals(stackOfPrimes.pop(),7);
         assertEquals(stackOfPrimes.pop(),5);
         assertEquals(stackOfPrimes.pop(),3);
         assertEquals(stackOfPrimes.pop(),2);
     }
}


