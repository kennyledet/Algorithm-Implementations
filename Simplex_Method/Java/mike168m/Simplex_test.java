package Michael;
          
//        // example standardized form
//        float[][] standardized = {
//                {1,1,1,0,4},
//                {1,3,0,1,6},
//                {-3,-5,0,0,0}
//          };
        
public class Simplex_test {

    public static void main(String[] args) {
        
        boolean quit = false;
        
        // Example problem:
        // maximize 3x + 5y 
        // subject to x +  y = 4 and
        //            x + 3y = 6
        float[][] standardized =  {
                { 1,   1,    1,  0,   4},
                { 1,   3,    0,  1,   6},
                {-3,  -5,    0,  0,   0}
        };
        
        // row and column do not include
        // right hand side values
        // and objective row
        Simplex simplex = new Simplex(2, 4);
        
        simplex.fillTable(standardized);

        // print it out
        System.out.println("---Starting set---");
        simplex.print();
        
        // if table is not optimal re-iterate
        while(!quit){
            Simplex.ERROR err = simplex.compute();

            if(err == Simplex.ERROR.IS_OPTIMAL){
                simplex.print();
                quit = true;
            }
            else if(err == Simplex.ERROR.UNBOUNDED){
                System.out.println("---Solution is unbounded---");
                quit = true;
            }
        }
    } 
}
