import java.util.Scanner;

public class Polynomial {

    int degreeOfPolynomial;
    double[] coefficients;

    public Polynomial() {

    }

    public Polynomial(int degree) {
        this.degreeOfPolynomial = degree;
        this.coefficients = new double[degree+1];

        for(int loopingVariable = 0; loopingVariable<=getDegree(); loopingVariable++) {
            this.coefficients[loopingVariable] = 0;
        }
    }

    public int getDegree() {
        return degreeOfPolynomial;
    }


    public String toString() {

        String polynomialExpression = "";
        int counter = 0;

        while(counter-1!=getDegree()) {

            if(counter == 0)
                polynomialExpression += "+" + polynomialExpression + coefficients[0];
            else
                polynomialExpression = "+" + coefficients[counter] + "x^" + counter + polynomialExpression;

            counter++;

        }

        return polynomialExpression;
    }

    public double evaluate(double x) {

        double resultOfExpression = coefficients[0];

        for(int loopVariable = 1; loopVariable<=getDegree(); loopVariable++) {
            resultOfExpression = resultOfExpression + coefficients[loopVariable]*Math.pow(x,loopVariable);
        }

        return resultOfExpression;
    }

    public static Polynomial add() {

        Scanner scannerObject = new Scanner(System.in);

        System.out.println("Enter degree of 1st polynomial");
        int degree1 = scannerObject.nextInt();
        System.out.println("Enter the degree of 2nd polynomial");
        int degree2 = scannerObject.nextInt();

        int smallerDegree = degree1<degree2 ? degree1:degree2;

        Polynomial objectForPolynomial1 = new Polynomial(degree1);
        Polynomial objectForPolynomial2 = new Polynomial(degree2) ;
        Polynomial objectForPolynomial3 = new Polynomial(smallerDegree);

        System.out.println("Enter the values of coefficients for 1st polynomial");
        for(int loopingVariable = 0;loopingVariable<=degree1;loopingVariable++)
            objectForPolynomial1.coefficients[loopingVariable] = scannerObject.nextInt();
        System.out.println("Enter the values of coeffcients for 2nd polynomial");
        for(int loopingVariable = 0;loopingVariable<=degree2;loopingVariable++)
            objectForPolynomial2.coefficients[loopingVariable] = scannerObject.nextInt();

        for(int loopingVariable = 0; loopingVariable<=smallerDegree;loopingVariable++) {
            objectForPolynomial3.coefficients[loopingVariable] = objectForPolynomial1.coefficients[loopingVariable] + objectForPolynomial2.coefficients[loopingVariable];
        }

       return objectForPolynomial3;
    }

    public static Polynomial multiply() {

        Scanner scannerObject = new Scanner(System.in);
        int greaterDegree;
        int smallerDegree;

        System.out.println("Enter the degree of 1st polynomial");
        int degree1 = scannerObject.nextInt();
        System.out.println("Enter the degree of 2nd polynomial");
        int degree2 = scannerObject.nextInt();

        if(degree1>degree2) {
            greaterDegree = degree1;
            smallerDegree = degree2;
        }
        else {
            greaterDegree = degree2;
            smallerDegree = degree1;
        }

        Polynomial objectForPolynomial1 = new Polynomial(greaterDegree);
        Polynomial objectForPolynomial2 = new Polynomial(smallerDegree);
        Polynomial objectForPolynomial3 = new Polynomial(greaterDegree+smallerDegree);

        System.out.println("Enter the values of coefficients for 1st polynomial");
        for(int loopingVariable = 0;loopingVariable<=greaterDegree;loopingVariable++)
            objectForPolynomial1.coefficients[loopingVariable] = scannerObject.nextInt();
        System.out.println("Enter the values of coeffcients for 2nd polynomial");
        for(int loopingVariable = 0;loopingVariable<=smallerDegree;loopingVariable++)
            objectForPolynomial2.coefficients[loopingVariable] = scannerObject.nextInt();

        for(int loop1=0;loop1<=greaterDegree;loop1++) {
            for(int loop2=0;loop2<=smallerDegree;loop2++) {
                objectForPolynomial3.coefficients[loop1+loop2] = objectForPolynomial1.coefficients[loop1] * objectForPolynomial2.coefficients[loop2];
            }
        }

        return objectForPolynomial3;
    }

    public static void main(String args[]) {

        System.out.println("Testing add function");
        Polynomial obj = add();
        System.out.println(obj.coefficients[0]);

        System.out.println("Testing multiply function");
        obj.multiply();
        System.out.println(obj.coefficients[0]);

    }
}

