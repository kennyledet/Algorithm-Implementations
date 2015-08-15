package levenshtein.distance;

public class Levenshtein_test {

	public static void main(String[] args) {
		
		String [] data = { "kitten", "sitting", "saturday", "sunday" };
        for (int i = 0; i < data.length; i += 2)
            System.out.println("distance(" + data[i] + ", " + data[i+1] + ") = " + Levenshtein.distance(data[i], data[i+1]));
		
	}
	
}
