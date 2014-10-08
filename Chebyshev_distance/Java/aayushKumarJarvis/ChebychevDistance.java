
public class ChebychevDistance {

    public double getMaximumValue(double elements[]) {

        double maxVal = elements[0];

        for(int loopVariable = 1;loopVariable<elements.length;loopVariable++) {
            if(elements[loopVariable] >= maxVal)
                maxVal = elements[loopVariable];
        }

        return maxVal;
    }

    public double getDistance(double a, double b) {

        return Math.sqrt(Math.abs(Math.pow(a,2) - Math.pow(b,2)));
    }

    public double calculateChebychevDistance(double listOfNumbers1[], double listOfNumbers2[]) {

        if(listOfNumbers1.length != listOfNumbers2.length)
            return 0;

        double distanceList[] = new double[listOfNumbers1.length];
        for(int loopVariable = 0; loopVariable<listOfNumbers1.length;loopVariable++) {

            distanceList[loopVariable] = getDistance(listOfNumbers1[loopVariable],listOfNumbers2[loopVariable]);
        }

        return getMaximumValue(distanceList);
    }
}

