import org.junit.Test;
import static org.junit.Assert.*;

public class PolynomialTest extends Polynomial {

    @Test
    public void getDegreeTest() {

        Polynomial objectForPolynomial = new Polynomial(5);
        assertEquals(objectForPolynomial.degreeOfPolynomial,5);
    }

    @Test
    public void toStringTest() {

        Polynomial objectForPolynomial = new Polynomial(5);

        objectForPolynomial.coefficients[0] = 1.0;
        objectForPolynomial.coefficients[1] = 2.0;
        objectForPolynomial.coefficients[2] = 3.0;
        objectForPolynomial.coefficients[3] = 4.0;
        objectForPolynomial.coefficients[4] = 5.0;
        objectForPolynomial.coefficients[5] = 6.0;

        String result = objectForPolynomial.toString();

        assertEquals(result,"+6.0x^5+5.0x^4+4.0x^3+3.0x^2+2.0x^1+1.0");
    }

    @Test
    public void evaluateTest() {

        Polynomial objectForPolynomial = new Polynomial(2);

        objectForPolynomial.coefficients[0] = 1.0;
        objectForPolynomial.coefficients[1] = 2.0;
        objectForPolynomial.coefficients[2] = 3.0;

        double result = objectForPolynomial.evaluate(2.0);

        assertEquals((int)result,17);
    }

}

