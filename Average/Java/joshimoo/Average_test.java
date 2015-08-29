package average;

import org.junit.Test;
import java.util.stream.DoubleStream;
import static org.junit.Assert.*;

/**
 * @author Joshua Moody (joshimoo@hotmail.de)
 */
public class AverageTest {
    private static final double DELTA = 0.01;

    @Test
    public void testAverageInequality() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };

        /**
         * Mean Inequalities:
         * Some means are in a constant relationship to one another.
         * If we denote the arithmentic mean of x and y by A,
         * their geometric mean by G,
         * their harmonic mean by H,
         * their root mean square (quadratic mean) by R,
         * and their contraharmonic mean by C,
         *
         * then the following chain of inequalities is always true
         * C >= R >= A >= G >= H
         */

        double contraHarmonic = Average.contraHarmonicMean(numbers);
        double quadratic = Average.quadraticMean(numbers);
        double arithmetic = Average.arithmeticMean(numbers);
        double geometric = Average.geometricMean(numbers);
        double harmonic = Average.harmonicMean(numbers);
        assertTrue("Your Average inequalities are not correct", (contraHarmonic >= quadratic) && (quadratic >= arithmetic) && (arithmetic >= geometric) && (geometric >= harmonic));
    }

    @Test
    public void testArithmeticMean() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = DoubleStream.of(numbers).average().getAsDouble();
        assertEquals(expected, Average.arithmeticMean(numbers), DELTA);
    }

    @Test
    public void testWeightedMean() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double[] weights = new double[] { 1, 1, 1, 1, 1 };
        double expected = DoubleStream.of(numbers).average().getAsDouble();
        assertEquals(expected, Average.weightedMean(numbers, weights), DELTA);
    }

    @Test
    public void testHarmonicMean() throws Exception {
        // n/(1/x1 + 1/x2 + ... + 1/xn)
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = numbers.length / DoubleStream.of(numbers).map(x -> 1.0 / x).sum();
        assertEquals(expected, Average.harmonicMean(numbers), DELTA);
    }

    @Test
    public void testContraHarmonicMean() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = DoubleStream.of(numbers).map(x -> Math.pow(x, 2.0)).sum() / DoubleStream.of(numbers).sum();
        assertEquals(expected, Average.contraHarmonicMean(numbers), DELTA);
    }

    @Test
    public void testGeometricMean() throws Exception {
        // (x1*x2*...xn) ^ (1/n)
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = Math.pow((numbers[0] * numbers[1] * numbers[2] * numbers[3] * numbers[4]), 1.0 / numbers.length);
        assertEquals(expected, Average.geometricMean(numbers), DELTA);
    }

    @Test
    public void testQuadraticMean() throws Exception {
        // sqrt((x1)^2+(x2)^2+(x3)^2+...+(xn)^2 /n)
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = Math.sqrt(DoubleStream.of(numbers).map(x -> Math.pow(x, 2)).sum() / numbers.length);
        assertEquals(expected, Average.quadraticMean(numbers), DELTA);
    }

    @Test
    public void testGeneralizedMean() throws Exception {
        // y-root((x1)^y+(x2)^y+(x3)^y+...+(xn)^y / n)
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double power = 4;
        double expected = Math.pow((DoubleStream.of(numbers).map(x -> Math.pow(x, 4)).sum() / numbers.length), 1.0 / power);
        assertEquals(expected, Average.generalizedMean(numbers, power), DELTA);
    }

    @Test
    public void testMidrange() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = (numbers[0] + numbers[numbers.length - 1]) / 2.0;
        assertEquals(expected, Average.midrange(numbers), DELTA);
    }

    @Test
    public void testMedianEven() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5, 6};
        double expected = (numbers[(numbers.length / 2) - 1] + numbers[numbers.length / 2]) / 2.0;
        assertEquals(expected, Average.median(numbers), DELTA);
    }

    @Test
    public void testMedianOdd() throws Exception {
        double[] numbers = new double[] { 1, 2, 3, 4, 5 };
        double expected = numbers[((int) Math.floor(numbers.length / 2))];
        assertEquals(expected, Average.median(numbers), DELTA);
    }

    @Test
    public void testMode() throws Exception {
        // frequency based average
        double[] numbers = new double[] { 1, 2, 3, 3, 3, 4, 5 };
        double expected = 3;
        assertEquals(expected, Average.mode(numbers), DELTA);
    }
}