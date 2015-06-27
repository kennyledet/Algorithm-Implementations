namespace Algorithms.algorithm {
    /*
 * @author Reza Ayadipanah
 * @date 27/06/15
 * @description http://en.wikipedia.org/wiki/Euclidean_algorithm
 * @implementations division, recursive
 */



    public static class EuclideanAlgorithm {
        public static uint GetGcdIterative(uint a, uint b) {
            if (a == 0) {
                return b;
            }
            if (b == 0) {
                return a;
            }
            if (b > a) {
                var temp = a;
                a = b;
                b = temp;
            }

            var reminder = a % b;
            while (reminder != 0) {
                a = b;
                b = reminder;
                reminder = a % b;
            }
            return b;
        }

        public static uint GetGcdRecurive(uint a, uint b) {
            if (a == 0) {
                return b;
            }
            if (b == 0) {
                return a;
            }
            if (b > a) {
                var temp = a;
                a = b;
                b = temp;
            }

            var reminder = a%b;
            if (reminder == 0) {
                return b;
            }
            return GetGcdRecurive(b, reminder);
        }
    }
}