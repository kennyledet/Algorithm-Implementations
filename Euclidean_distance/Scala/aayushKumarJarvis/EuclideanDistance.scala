import scala.math

class EuclideanDistance {

  def calculateDistance(cordinate1:(Int,Int),cordinate2:(Int,Int)):Int = {

    val squaredCordinate1 = (cordinate1._1 - cordinate2._1) * (cordinate1._1 - cordinate2._1)
    val squaredCordinate2 = (cordinate1._2 - cordinate2._2) * (cordinate1._2 - cordinate2._2)

    val distance = math.sqrt((squaredCordinate1 + squaredCordinate2).toDouble)

    distance.toInt
  }
}

