object bresenham_line {
  case class Point(x: Int, y: Int)

  /**
    * Uses the Bresenham Algorithm to calculate all points on a line from (x0, y0) to (x1, y1).
    * The iterator returns all points in the interval [start, end[.
    * @param x0 start point x
    * @param y0 start point y
    * @param x1 end point x
    * @param y1 end point y
    * @return the iterator containing all points on the line
    */
  def bresenham(x0: Int, y0: Int, x1: Int, y1: Int): Iterator[Point] = {
    import scala.math.abs

    val dx = abs(x1 - x0)
    val dy = abs(y1 - y0)

    val sx = if (x0 < x1) 1 else -1
    val sy = if (y0 < y1) 1 else -1

    new Iterator[Point] {
      var (x, y) = (x0, y0)
      var err = dx - dy

      def next = {
        val point = Point(x, y)
        val e2 = 2 * err
        if (e2 > -dy) {
          err -= dy
          x += sx
        }
        if (e2 < dx) {
          err += dx
          y += sy
        }
        point
      }

      def hasNext = !(x == x1 && y == y1)
    }
  }

}