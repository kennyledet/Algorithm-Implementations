import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.junit.Assert;

import java.util.Arrays;

@RunWith(JUnit4.class)
public class PrimMST_test {

    @Test
    public void test() {
		int[][] edges = { { 1, 2, 4 }, { 2, 1, 4 }, { 1, 8, 8 }, { 8, 1, 8 }, { 2, 8, 11 }, { 8, 2, 11 }, { 2, 3, 8 },
				{ 3, 2, 8 }, { 3, 9, 2 }, { 9, 3, 2 }, { 3, 6, 4 }, { 6, 3, 4 }, { 3, 4, 7 }, { 4, 3, 7 }, { 4, 5, 9 },
				{ 5, 4, 9 }, { 4, 6, 14 }, { 6, 4, 14 }, { 5, 6, 10 }, { 6, 5, 10 }, { 6, 7, 2 }, { 7, 6, 2 },
				{ 7, 8, 1 }, { 8, 7, 1 }, { 7, 9, 6 }, { 9, 7, 6 }, { 8, 9, 7 }, { 9, 8, 7 } };

        PrimMST p = new PrimMST();
		for (int[] edge : edges) {
		    p.addEdge(edge[0], edge[1], edge[2]);
		}

		Assert.assertEquals(37, p.prim(1), 0);
    }

}
