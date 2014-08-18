
public class TestConvextHull {

    public static void main(String args[]) {

        ConvexHull.Point p1,p2,q1,q2;

        p1 = new ConvexHull.Point();
        p2 = new ConvexHull.Point();
        q1 = new ConvexHull.Point();
        q2 = new ConvexHull.Point();

        p1.xCordinate = 1; p1.yCordinate = 1;
        p2.xCordinate = 1; p2.yCordinate = 2;

        q1.xCordinate = 10; q1.yCordinate = 1;
        q2.xCordinate = 10; q2.yCordinate = 2;

        ConvexHull objectForCovexHull = new ConvexHull();

        boolean result = objectForCovexHull.doIntersect(p1,q1,p2,q2);

        if(result)
            System.out.println("Yes");
        else
            System.out.println("No");
    }
}

