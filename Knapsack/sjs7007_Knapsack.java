//Knapsack Algo
import java.util.*;

class Element
{
	double weight,profit,ratio;
	int id;

	Element(double p,double w)
	{
		profit=p;
		weight=w;
		ratio=p/w;
	}
}

class KnapSack
{
	Scanner ip = new Scanner(System.in);
	int n;
	double capacity,currentCapacity,profit=0;
	Element E[]; 

	KnapSack(int x,double y)
	{
		n=x;
		capacity=y;
		currentCapacity=capacity;
		E=new Element[n]; 
		inputData();
		sortInc();
		insert();
	}

	void inputData()
	{
		for(int i=0;i<n;i++)
		{
			System.out.print("Enter profit and weight of element " +(i+1)+" : ");
			E[i]=new Element(ip.nextDouble(),ip.nextDouble()); 
			E[i].id=i+1;
		}
	}

	void sortInc() //Sort in increasing order of p/w ratio
	{
		for(int i=0;i<n;i++)
		{
			for(int j=i+1;j<n;j++)
			{
				if(E[i].ratio<E[j].ratio)
				{
					Element temp=E[i];
					E[i]=E[j];
					E[j]=temp;
				}
			}
		}
	}

	void insert()
	{
		for(int i=0;currentCapacity!=0;i++)
		{
			if(currentCapacity>=E[i].weight)
			{
				System.out.println("Insert Element "+E[i].id);
				profit=profit+E[i].profit;
				currentCapacity=currentCapacity-E[i].weight;
			}
			else
			{
				double temp=currentCapacity/E[i].weight;
				profit=profit+temp*E[i].profit;
				System.out.println("Insert Fraction "+temp+" of Element "+E[i].id);
				currentCapacity=0;
			}
		}
		System.out.println("Profit : "+profit);
	}


}

class sjs7007_Knapsack
{
	public static void main(String[] args) 
	{
		Scanner ip = new Scanner(System.in);
		System.out.print("Enter number of elements and capacity of Knapsack : ");
		int n=ip.nextInt(); //no. of elements
		double w=ip.nextDouble();	
		KnapSack K = new KnapSack(n,w);
	}
}

/* Output

Enter number of elements and capacity of Knapsack : 3 40
Enter profit and weight of element 1 : 20 10
Enter profit and weight of element 2 : 10 20
Enter profit and weight of element 3 : 15 34
Insert Element 1
Insert Element 2
Insert Fraction 0.29411764705882354 of Element 3
Profit : 34.411764705882355

*/