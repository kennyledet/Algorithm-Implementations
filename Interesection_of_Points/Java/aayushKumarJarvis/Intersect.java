

public class Intersect {

    // Defining a structure Point in form of an inner class rather than creating fresh class.
    static class Point {

        int xCordinate;
        int yCordinate;
    }

    public boolean onSegment(Point p, Point q, Point r) {

        if(q.xCordinate <= Math.max(p.xCordinate,r.xCordinate) && q.xCordinate >= Math.min(p.xCordinate,r.xCordinate)
           && q.yCordinate <= Math.max(p.yCordinate,r.yCordinate) && q.yCordinate >= Math.min(p.yCordinate,r.yCordinate))

            return true;

        return false;
    }

    public int orientation(Point p, Point q, Point r) {

        int val = (q.yCordinate - p.yCordinate) * (r.xCordinate - q.xCordinate) -
                  (q.xCordinate - p.xCordinate) * (r.yCordinate - q.yCordinate);

        if(val == 0) return 0;

        return (val>0) ? 1:2;
    }

    public boolean doIntersect(Point p1, Point q1, Point p2, Point q2) {

        int o1 = orientation(p1,q1,p2);
        int o2 = orientation(p1,q1,q2);
        int o3 = orientation(p2,q2,p1);
        int o4 = orientation(p2,q2,q1);

        if(o1!=o2 && o3!=o4)
            return true;

        if (o1 == 0 && onSegment(p1, p2, q1)) return true;
        if (o2 == 0 && onSegment(p1, q2, q1)) return true;
        if (o3 == 0 && onSegment(p2, p1, q2)) return true;
        if (o4 == 0 && onSegment(p2, q1, q2)) return true;

        return false;
    }

}

