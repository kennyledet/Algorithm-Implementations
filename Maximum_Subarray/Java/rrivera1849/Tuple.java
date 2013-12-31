public class Tuple<X,Y,Z> {
	private X x;
	private Y y;
	private Z z;
	
	public Tuple(X x, Y y, Z z){
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	public void setX(X x){
		this.x = x;
	}
	
	public void setY(Y y){
		this.y = y;
	}
	
	public void setZ(Z z){
		this.z = z;
	}
	
	public X getX(){
		return x;
	}
	
	public Y getY(){
		return y;
	}
	
	public Z getZ(){
		return z;
	}
	
	public String toString(){
		return "(" + x + "," + y + "," + z + ")";
	}

}
