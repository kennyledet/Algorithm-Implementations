/**
  * Written by: ghostsnstuff
  * Last Updated: March 22, 2014
  * Source: http://en.wikipedia.org/wiki/Norm_(mathematics)#Euclidean_norm
  * Logic: square each element in the vector -> summate all squared values -> take the square root of the sum
  */
class EuclideanNorm {
  static double euclidean_norm(int[] vec) {
    double sum = 0;
    for(int i = 0; i < vec.length; i++) {
      sum += vec[i] * vec[i];
    }
    return Math.sqrt(sum);
  }
}
