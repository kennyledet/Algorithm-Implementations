
public class IntersectTest {

    public static void main(String args[]) {

        Intersect.Point p1,p2,q1,q2;

        p1 = new Intersect.Point();
        p2 = new Intersect.Point();
        q1 = new Intersect.Point();
        q2 = new Intersect.Point();

        p1.xCordinate = 1; p1.yCordinate = 1;
        p2.xCordinate = 1; p2.yCordinate = 2;

        q1.xCordinate = 10; q1.yCordinate = 1;
        q2.xCordinate = 10; q2.yCordinate = 2;

        Intersect objectForIntersect = new Intersect();

        boolean result = objectForIntersect.doIntersect(p1,q1,p2,q2);

        if(result)
            System.out.println("Yes");
        else
            System.out.println("No");
    }
}

