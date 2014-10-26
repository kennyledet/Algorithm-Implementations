

import java.util.Iterator;
import java.util.LinkedList;

public class BFS {
	private Graph graph;
	private LinkedList<LinkedList<vertex>> queue;
	private vertex tempVertex;
	private LinkedList<vertex> templist;
	public BFS(Graph graph) {
		queue = new LinkedList<LinkedList<vertex>>();
		this.graph = graph;
		
	}
	public void traverse(){
		find(null);
	}
	public void find(vertex v){
		templist =(LinkedList<vertex>) graph.getconnectedvertices(0);
		templist.getFirst().setVisited(true);
		System.out.println();
		System.out.println("the vertex "+templist.getFirst().getValue()+" is visited");
		queue.add(templist);
		
		while (!queue.isEmpty()){
		templist = queue.pop();
		if(v !=null){
		if(templist.getFirst().equals(v)){
			System.out.println("match found "+templist.getFirst());
			break;
		}
		}
		for (int i = 0; i < templist.size(); i++) {
			tempVertex = templist.get(i);  // to reduce the overhead of lookups
			if (tempVertex.isVisited() == false){
				System.out.println("setting the node visited to true "+tempVertex.getValue());
				templist.get(i).setVisited(true);
				System.out.println("adding node "+tempVertex.getValue()+" to the queue");
				queue.add(graph.getconnectedvertices(tempVertex));
			}
			
			
		}
		System.out.println("the queue is"+queue);
		System.out.println();
		}
		
	}
	public static void main(String[] args) {
		Graph gp = new Graph(10);
		gp.add(new vertex(6), 0);
		gp.add(new vertex(8), 1);
		gp.add(new vertex(9), 2);
		gp.add(new vertex(10), 3);
		gp.addEdge(0, 1);
		gp.addEdge(1,0);
		gp.addEdge(1,2);   //even though the my graph is directed graph just for a simple example created a symmetric(undirected) graph
		gp.addEdge(2,1);
		gp.addEdge(2,3);
		gp.addEdge(3,2);
		gp.addEdge(3,0);
		gp.addEdge(0,3);
		gp.allVertices().forEach(item -> System.out.println(gp.getconnectedvertices(item)));
		BFS x = new BFS(gp);
		x.traverse();
		}
		
		
	}


