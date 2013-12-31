import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.junit.Assert;

import java.util.Arrays;

@RunWith(JUnit4.class)
public class FloydWarshall_test {

    @Test
    public void basicTest() {
        FloydWarshall fw = new FloydWarshall(4);
        double INF = Double.POSITIVE_INFINITY;
        double[][] expected ={ {0,   5,   8,   9},
                               {INF, 0,   3,   4},
                               {INF, INF, 0,   1},
                               {INF, INF, INF, 0} };
        fw.addEdge(0, 1, 5);
        fw.addEdge(0, 2, 9);
        fw.addEdge(0, 3, 10);
        fw.addEdge(1, 2, 3);
        fw.addEdge(2, 3, 1);

        double[][] result = fw.floydWarshall();
        String errorMsg = String.format("Failure - Expected: %s Got: %s", Arrays.deepToString(expected), 
                Arrays.deepToString(result));
        Assert.assertArrayEquals(errorMsg, expected, result);
    }

    @Test
    public void negativeWeights() {
        FloydWarshall fw = new FloydWarshall(4);
        double INF = Double.POSITIVE_INFINITY;
        double[][] expected ={ {0,   1,   -2,    1},
                               {INF, 0,   INF,   3},
                               {INF, INF, 0,     3},
                               {INF, INF, INF,   0} };
        fw.addEdge(0, 1, 1);
        fw.addEdge(0, 2, -2);
        fw.addEdge(1, 3, 3);
        fw.addEdge(2, 3, 3); 

        double[][] result = fw.floydWarshall();
        String errorMsg = String.format("Failure - Expected: %s Got: %s", Arrays.deepToString(expected), 
                Arrays.deepToString(result));
        Assert.assertArrayEquals(errorMsg, expected, result);
    }

    @Test
    public void detectsNegativeCycles() {
        FloydWarshall fw = new FloydWarshall(1);
        double[][] expected = new double[1][1];
        expected[0][0] = -2;
        fw.addEdge(0, 0, -1);

        double[][] result = fw.floydWarshall();
        String errorMsg = String.format("Failure - Expected: %s Got: %s", Arrays.deepToString(expected), 
                Arrays.deepToString(result));
        Assert.assertArrayEquals(errorMsg, expected, result);
        Assert.assertTrue("failure - hasNegativeCycle() should be true", fw.hasNegativeCycle());
    }

}
