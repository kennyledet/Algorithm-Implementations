


class EuclideanAlgorithm {

    def calculateGCD(number1:Int, number2:Int): Int = {

      if(number2 == 0) number1
      else
        calculateGCD(number2, number1%number2)
    }
}

