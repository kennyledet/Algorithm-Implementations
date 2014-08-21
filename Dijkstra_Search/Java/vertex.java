package week4_graphs;

public class vertex {
	private int value;
	
	private boolean visited;
	public vertex(int value) {
		this.setValue(value);
		
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public boolean isVisited() {
		return visited;
	}
	public void setVisited(boolean visited) {
		this.visited = visited;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return value+"";
		
	}
	public boolean equals(vertex obj) {
			
		
		// TODO Auto-generated method stub
		return (getValue() == obj.getValue()) ? true :false;
	}

}
