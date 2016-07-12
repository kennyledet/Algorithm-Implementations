package happy.number;

public class HappyNumber_test {

	public static void main(String[] args) {

		HappyNumber hn = new HappyNumber();
		for (int i = 0; i <= 1000; i++) {
			
			if(hn.isHappyNumber(i))
				System.out.println(i + " is a Happy Number :) ");
			else
				System.out.println(i + " is not a Happy Number :( ");
		}
	}
}
