/*
 * Written by: Swapnesh Khare
 * Last Update: 29 October, 2013
*/
public class link {
	public link Left;
	public link Right;
	public int data;
	public link parent;
	
	public link(link nextL, link nextR, link parent,int data)
	{
		this.data = data;
		this.Left = nextL;
		this.Right = nextR;
		this.parent = parent;
	}
	
	public int getData()
	{
		return data;
	}
	
	public link getLeft()
	{
		return Left;
	}
	
	public link getRight()
	{
		return Right;
	}
	
	public link getParent()
	{
		return parent;
	}
}
