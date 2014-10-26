public class Ackermann {

    /**
     * Compute the Ackerman function
     * @param m
     * @param n
     * @return the result of the function.
     */
    public static long compute(long m,long n){
        if(m == 0){
            return (n + 1);
        }else if(m > 0 && n == 0){
            return compute(m - 1, 1);
        }else{
            return compute(m - 1, compute(m, n - 1));
        }
    }
}