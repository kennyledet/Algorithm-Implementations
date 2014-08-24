import org.junit.Test;
import static org.junit.Assert.*;

public class TestChebychevDistance {

    @Test
    public void chebychevTest() {

        double list1[] = {0,3,4,5};
        double list2[] = {7,6,3,-1};

        ChebychevDistance objectForChebychev = new ChebychevDistance();

        double result = objectForChebychev.calculateChebychevDistance(list1,list2);
        double answer = 7;
        double epsilon = 0.001;

        assertEquals(result,answer,epsilon);
    }
}

