package average;

import java.util.*;
import java.util.stream.DoubleStream;

/**
 * @author Joshua Moody (joshimoo@hotmail.de)
 */
public final class Average {
    /**
     * Don't let anyone instantiate this class.
     */
    private Average() {}

    /**
     * calculate a regular arithmetic mean average
     * @throws NoSuchElementException if the array is empty
     */
    public static double arithmeticMean(double... numbers) {
        assert numbers != null && numbers.length > 0;
        return DoubleStream.of(numbers).average().getAsDouble();
    }

    /**
     * calculates a weighted mean average
     * numbers and weights need to have the same count
     */
    public static double weightedMean(double[] numbers, double[] weights) {
        assert numbers.length == weights.length;
        double weightedSum = 0;
        for (int i = 0; i < numbers.length; i++) {
            weightedSum += numbers[i] * weights[i];
        }

        return weightedSum / DoubleStream.of(weights).sum();
    }

    /**
     * calculates the harmonic mean average
     * according to this formula: n/(1/x1 + 1/x2 + ... + 1/xn)
     */
    public static double harmonicMean(double... numbers) {
        return numbers.length / DoubleStream.of(numbers).map(x -> 1.0 / x).sum();
    }

    /**
     * calculates the contra harmonic mean average
     * according to this formula: (x1^2 + x2^2 + ... + xn^2)/(x1 + x2 + ... + xn)
     */
    public static double contraHarmonicMean(double... numbers) {
        return DoubleStream.of(numbers).map(x -> Math.pow(x, 2.0)).sum() / DoubleStream.of(numbers).sum();
    }

    /**
     * calculates the geometric mean average
     * for small amount of numbers according to this formula: (x1*x2*...xn) ^ (1/n)
     * for large amount of numbers, by summing the logarithms of each x
     */
    public static double geometricMean(double... numbers) {
        // TODO: For large numbers, consider summing the logarithms of each x
        // (x1*x2*...xn) ^ (1/n)
        return Math.pow(DoubleStream.of(numbers).reduce(1.0, (a, x) -> (a * x)), 1.0d / numbers.length);
    }

    /**
     * calculates the quadratic mean average
     * according to  this formula: sqrt( (x1)^2+(x2)^2+(x3)^2+...+(xn)^2 /n )
     */
    public static double quadraticMean(double... numbers) {
        return generalizedMean(numbers, 2.0);
    }

    /**
     * calculates a generalized mean average
     * according to this formula: y-root( (x1)^y+(x2)^y+(x3)^y+...+(xn)^y / n )
     */
    public static double generalizedMean(double[] numbers, double power) {
        return Math.pow(arithmeticMean(DoubleStream.of(numbers).map(x -> Math.pow(x, power)).toArray()), 1.0 / power);
    }

    /**
     * Get the mid value beetwen min and max
     */
    public static double midrange(double... numbers) {
        DoubleSummaryStatistics stat = DoubleStream.of(numbers).summaryStatistics();
        return arithmeticMean(stat.getMin(), stat.getMax());
    }

    /**
     * calculates the median average for sorted list of numbers
     * @param numbers needs to be sorted
     * @return mean average of left and right for even numbers, else mid element
     */
    public static double median(double... numbers) {
        if (numbers.length % 2 == 0) {
            double left = numbers[(numbers.length / 2) - 1];
            double right = numbers[numbers.length / 2];
            return arithmeticMean(left, right);
        } else {
            double mid = numbers[((numbers.length + 1) / 2) - 1];
            return mid;
        }
    }

    /**
     * calculates the mode average
     * which returns the element, with highest occurrence count
     */
    public static double mode(double... numbers) {
        // Stupid Type System, all this boxing :(
        Map<Double, Integer> frequencies = new HashMap<>();

        for(double key : numbers) {
            frequencies.put(key, frequencies.getOrDefault(key, 0) + 1);
        }

        Double maxElement = numbers[0];
        for (Map.Entry<Double, Integer> element : frequencies.entrySet()) {
            if(element.getValue() > frequencies.get(maxElement)) {
                maxElement = element.getKey();
            }
        }

        return maxElement;
    }

}
