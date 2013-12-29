import scala.annotation.tailrec

object kmeans_clustering {

  /**
    * Simple 3d Vector class
    * @param a first component
    * @param b second component
    * @param c third component
    */
  case class Vector(a: Double, b: Double, c: Double) {
    /**
      * Adds two vectors.
      * @param that the other vector
      * @return the sum
      */
    def +(that: Vector): Vector = Vector(a + that.a, b + that.b, c + that.c)

    /**
      * Subtracts two vectors
      * @param that the other vector
      * @return the difference
      */
    def -(that: Vector): Vector = Vector(a - that.a, b - that.b, c - that.c)

    /**
      * The cross product of two vectors
      * @param that the other vecto
      * @return the cross product
      */
    def x(that: Vector): Vector = Vector(b * that.c - c * that.b, a * that.c - c * that.a, a * that.b - b * that.a)

    /**
      * The dot product of two vectors.
      * @param that the other vector
      * @return the dot product
      */
    def *(that: Vector): Double = this.a * that.a + this.b * that.b + this.c * that.c

    /**
      * Multiplies the vector with a scalar.
      * @param s the scalar
      * @return the resulting vector
      */
    def *(s: Double): Vector = Vector(this.a * s, this.b * s, this.c * s)

    /**
      * The length of the vector
      * @return the length
      */
    def length: Double = math.sqrt(this * this)

    /**
      * Normalises the vector.
      * @return the normalised vector
      */
    def normalised: Vector = Vector(a / length, b / length, c / length)

    override def toString = s"Vector($a, $b, $c)"

    override def equals(obj: scala.Any): Boolean = obj match {
      case v: Vector ⇒
        val vn = v.normalised
        val tn = this.normalised

        vn.a == tn.a && vn.b == tn.b && vn.c == tn.c
      case _ ⇒ false
    }
  }

  /**
    * A Cluster, represented by its centre and the members belonging to this cluster.
    * @param centre the centre of the cluster
    * @param members the members of this cluster
    */
  class Cluster(var centre: Vector, var members: List[Vector]) {
    override def toString = s"Cluster(Centre: $centre, members: $members)"
  }

  /**
    * A similarity measure.
    * @tparam T the type
    */
  trait SimilarityMeasure[T] {
    /**
      * Calculates the similarity between two entities.
      * @param x 1st entity
      * @param y 2nd entity
      * @return the similarity
      */
    def s(x: T, y: T): Double
  }

  /**
    * The cosine similarity uses the cosine of the angle between two vectors to measure the similarity.
    */
  implicit object CosineSimilarity extends SimilarityMeasure[Vector] {
    def s(x: Vector, y: Vector): Double = (x * y) / (x.length * y.length)
  }

  /**
    * Clusters a list of vectors and groups them into c clusters.
    * @param values the vectors to be clustered
    * @param c the number of clusters
    * @param sim the similarity measure that is used for the similarity calculations
    * @return the list of found clusters
    */
  def kmeans(values: List[Vector], c: Int)(implicit sim: SimilarityMeasure[Vector]): List[Cluster] = {
    assert(values.size >= c)
    recalc(values.take(c), values)
  }

  @tailrec
  private def recalc(centres: List[Vector], values: List[Vector])(implicit sim: SimilarityMeasure[Vector]): List[Cluster] = {
    // Setting up new clusters
    val clusters = for {
      centre ← centres
    } yield new Cluster(centre, Nil)

    // Assigning vector to cluster with highest similarity.
    for (v ← values) {
      var d = (clusters(0), sim.s(clusters(0).centre, v))
      for (cluster ← clusters) {
        val dist = sim.s(cluster.centre, v)
        if (d._2 < dist) {
          d = (cluster, dist)
        }
      }
      d._1.members = v :: d._1.members
    }

    // Updating the centres of every cluster
    for (cluster ← clusters) {
      val mp = if (cluster.members.size > 0) midpoint(cluster.members) else cluster.centre
      cluster.centre = mp
    }

    val newCentres = clusters.collect {
      case c ⇒ c.centre
    }

    // Checking how many cluster centres were changed in this run. If nothing changed we return the list of clusters.
    if (centres.diff(newCentres).size < 1) {
      clusters
    } else {
      recalc(newCentres, values)
    }
  }

  private def midpoint(members: List[Vector]): Vector = members.foldRight(Vector(0, 0, 0))(_ + _) * (1.0 / members.size)

}
