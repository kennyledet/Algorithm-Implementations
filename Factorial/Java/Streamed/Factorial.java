import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException; 
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;


@Warmup(iterations = 5)
@Measurement(iterations = 10)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MILLISECONDS)
@State(Scope.Benchmark)
@Fork(2)
public class Factorial {

    @Param({"10", "100", "1000", "10000", "50000", "100000"})
    private int n;

    public static BigInteger streamedParallel(int n) {
        if (n < 2) {
            return BigInteger.valueOf(1);
        }
        return IntStream.rangeClosed(2, n).parallel().mapToObj(BigInteger::valueOf).reduce(BigInteger::multiply).get();
    }
    
    public static BigInteger revstreamedParallel(int n) {
        if (n < 2) {
            return BigInteger.valueOf(1);
        }
        return IntStream.iterate(n, i->i-1).limit(n-1).parallel().mapToObj(BigInteger::valueOf).reduce(BigInteger::multiply).get();
    }
   
    //Tree
    public static BigInteger ProdTree(int left, int right) {
        if (left > right) {
            return BigInteger.ONE;
        }
        if (left == right) {
            return BigInteger.valueOf(left);
        }
        if (right - left == 1) {
            return BigInteger.valueOf(left).multiply(BigInteger.valueOf(right));
        }
        int m = (left + right) / 2;
        return ProdTree(left, m).multiply(ProdTree(m + 1, right));
    }

    public static BigInteger TreeFactorial(int n) {
        if (n < 0) {
            return BigInteger.ZERO;
        }
        if (n == 0) {
            return BigInteger.ONE;
        }
        if (n == 1 || n == 2) {
            return BigInteger.valueOf(n);
        }
        return ProdTree(2, n);
    }
    

    @Benchmark
    public void testStreamedParallel(Blackhole bh) {
        bh.consume(streamedParallel(n));
    }
    
    @Benchmark
    public void testTreeFactorial(Blackhole bh) {
        bh.consume(TreeFactorial(n));
    }
    
    
    
    public static void main(String[] args) throws RunnerException {

         Options opt = new OptionsBuilder()
                .include(Factorial.class.getSimpleName())
                .forks(1)
                .build();

        new Runner(opt).run();
    }
}
