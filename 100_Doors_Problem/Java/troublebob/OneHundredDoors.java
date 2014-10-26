import java.util.Arrays;

/*There are 100 doors in a long hallway. They are all closed. 
 * The first time you walk by each door, you open it. 
 * The second time around, you close every second door (since they are all opened). 
 * On the third pass you stop at every third door and open it if it’s closed, close it if it’s open. 
 * On the fourth pass, you take action on every fourth door. You repeat this pattern for 100 passes.
 * At the end of 100 passes, what doors are opened and what doors are closed?
 */	

public class OneHundredDoors {

	static int[] doors= new int [100];

	public static void main(String[] args) {
		
		//Open all doors
		Arrays.fill(doors, 0);
		for(int i = 1; i<=99; i++){
			passDoors(i);
		}
		
		System.out.println(printDoors(100));
		
	}
	public static void passDoors(int pass){
		for(int i = pass-1; i <= 99; i+=pass){
			
			if(doors[i]==1){
				doors[i]=0;
			}else{
				doors[i]=1;
			}
		}
		//System.out.println(printDoors(pass));
	}
	public static String printDoors(int pass){
		String s="The following doors are open after "+pass+" passes:\n";
		for(int i=0;i<=99;i++){
			if(doors[i]==1){
				s+= i;
				s+= ", ";
			}
		}
		return s;
	}

}
