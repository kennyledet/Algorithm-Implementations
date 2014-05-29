import org.junit.Test;
import static org.junit.Assert.*;

public class AckermannTest {
    

    @Test
    public void testCompute() {
        System.out.println("Test right answers");
        assertEquals(1, Ackermann.compute(0, 0));
        assertEquals(2, Ackermann.compute(0, 1));
        assertEquals(3, Ackermann.compute(0, 2));
        assertEquals(7, Ackermann.compute(2, 2));
        assertEquals(11, Ackermann.compute(2, 4));
        assertEquals(29, Ackermann.compute(3, 2));
        assertEquals(253, Ackermann.compute(3, 5));

        System.out.println("Test wrong answers");
        assertNotSame(0, Ackermann.compute(0, 0));
        assertNotSame(1, Ackermann.compute(0, 1));
        assertNotSame(2, Ackermann.compute(0, 2));
        assertNotSame(4, Ackermann.compute(2, 2));
        assertNotSame(12, Ackermann.compute(2, 4));
        assertNotSame(30, Ackermann.compute(3, 2));
        assertNotSame(256, Ackermann.compute(3, 5));
    }
    
}
