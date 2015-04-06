

import java.util.Arrays;
import java.util.LinkedList;
import java.util.function.Function;

public class Graph {
	private LinkedList<vertex>[] linkedlistGroup;
	private int capacity ;
	private Function<Integer, Boolean> isinvalid= (item) -> (item > capacity || item < 0)  ? true : false;
			LinkedList<vertex> temp;
	
	/**
	 * @param capacity
	 */
	
	@SuppressWarnings("unchecked")
	public Graph(int capacity){
		this.capacity=capacity;
		linkedlistGroup = new LinkedList[capacity];
		for (int i = 0; i < capacity; i++) {
			linkedlistGroup[i] = new LinkedList<vertex>();
			
			
		}
		
		
	}
/**
 * @param v - find the <strong>vertex </strong> using the id of the vertex
 * @return an iterable so that u can wrap it in any collection that implements the iterable interface
 */
public Iterable<vertex> getconnectedvertices(int v){
	if(isinvalid.apply(v)) throw new IndexOutOfBoundsException("the vertex is not present in the graph");
		return linkedlistGroup[v];
		
			
	}
	public LinkedList<vertex> getconnectedvertices(vertex v){
		
		
		Arrays.stream(linkedlistGroup).forEach(item -> {
			
			if(!item.isEmpty())
			{
				
				if(item.getFirst().equals(v)){
					temp = item;
					
				}
			}
			
			
		
		} );
		return temp;
		
	}
	
	public void add(vertex v, int loc){
		
		linkedlistGroup[loc].add(v);

	}
	
	public LinkedList<vertex> allVertices(){

		LinkedList<vertex> v = new LinkedList<vertex>(); 
		Arrays.stream(linkedlistGroup).forEach(item ->{
		if(!item.isEmpty())v.add(item.getFirst());
		});	
		return v;
		
	}
	public void addEdge(int to , int from){
		if(isinvalid.apply(to)) throw new IndexOutOfBoundsException("the vertex is not present in the graph");
		if(isinvalid.apply(to)) throw new IndexOutOfBoundsException("the vertex is not present in the graph");
		linkedlistGroup[to].add(linkedlistGroup[from].getFirst());
		
		
	}
	public vertex getvertex(int vertex){
		return linkedlistGroup[vertex].getFirst();
		
		
	}
	public static void main(String[] args) {
		Graph gf = new Graph(10);
	
	}
	
	

}
