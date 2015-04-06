/*
 * Written by: Swapnesh Khare
 * Last Update: 29 October, 2013
*/
import java.util.Stack;

public class BST_using_LinkedList {
	public link root;
	static boolean test = false;
	
	public list()
	{
		root = null;
	}
	
	void insertAtTail(int data)
	{
		if(root == null)	// if new node is the first node
				root = new link(null, null, null, data);
		
		else
		{
			link temp = root;
			
			while(temp != null) 
				{
					if (temp.data >= data)	// if the new node has to be put on the left side
					{
						link temp2 = temp.Left;
						if(temp2 == null)
						{
								temp2 = new link(null, null, temp, data);
								temp.Left = temp2;
								break;
						}
						temp = temp2;
					}
					
					else 
					{
						link temp2 = temp.Right;
						if(temp2 == null)
						{
							temp2 = new link(null, null, temp, data);
							temp.Right = temp2;
							break;
						}
						temp = temp2;
					}
					
				}
		}
	}
	
	public link getRoot()
	{
		return root;
	}
	
	public link maximumNode(link n)
    {
        while(n.getRight()!=null)
        	n=n.getRight();
        
        return n;
    }
	
	public link minimumNode(link n)
    {
        while(n.getLeft()!=null)
        	n=n.getLeft();
        
        return n;
    }
	
	public link successor(link x)
    {
    	// successor is the minimum node on the right subtree
        if(x.Right!=null)
        {
        	return minimumNode(x.Right);
        }

        // or its the parent
        link y=x.getParent();
        while(y!=null && x == y.getRight())
        {
    	   	x=y;
        	y=y.getParent();
        }
        return y;
    }
	
	public link predeccessor(link x)
    {
		// successor is the minimum node on the left subtree
        if(x.Left!=null)
        {
        	return maximumNode(x.Left);
        }
        // or its the parent
        link y=x.getParent();
        while(y!=null && x == y.getLeft())
        {
        	x=y;
        	y=y.getParent();
        }
        return y;
    }
	
	void DeleteItem (link x, int item)
	{
	   if (x == null) 	
		return;

		// searching which subtree contains the item
	   if (item < x.data)          
	     DeleteItem (x.Left, item);
	   else if (item > x.data)     
	     DeleteItem (x.Right, item);
	   else                            
	     DeleteNode (x); // found
	}
	
	void DeleteNode (link x)
	{
	  link temp;
	  
	  if (x.Left == null && x.Right == null)		// no child
	  {
		  if(x == x.parent.Left)
			  x.parent.Left = null;
		  else
			  x.parent.Right = null;
	    }
	  else if (x.Right == null)		// no right child
	    {
		  if(x == x.parent.Left)
			  x.parent.Left = x.Left;
		  else
			  x.parent.Right = x.Right;
	    }
	  else if(x.Left == null)		// no left child
	  {
		  if(x == x.parent.Left)
			  x.parent.Left = x.Right;
		  else
			  x.parent.Right = x.Right;

	  }
		   
	  else                           // both children exist so the item has to be replaced by its predecessor
	    {
	     temp = x.Left;          
	     while (temp.Right != null)
	       temp = temp.Right;
	     x.data = temp.data;    
	     DeleteItem (x.Left, x.data);   // delete the predecessor
	    }
	}
	
	public int getHeight(link node) 
    {
        if(node == null)
        {
            return -1;
        }
        return Math.max(getHeight(node.Left), getHeight(node.Right)) + 1;
    }

    public int getDepth(link node) 
    {
        if(node == null)
        {
            return -1;
        }
        return getDepth(node.parent) + 1;
    }

	public int getMax(int x,int y)
    {
    	if(x>y)
    		return x;
    	else if(y>x) 
    		return y;
    	else 
    		return x;
    }
	
	public link searchNode(link x, int value)
	{
		if(x == null || x.data == value)
			return x;
		
		else
		{
			if(value > x.data)
				return searchNode(x.Right, value);
			else
				return searchNode(x.Left, value);
		}
	}
	
	public void rotateLeft(int key)
	{
		link node = searchNode(root, key);
		if(node != root)
		{
			if(node.parent.parent != null)
			{
				if(node.parent == node.parent.parent.Right)
				{
					link x = node.parent;
					node.parent = x.parent;
					x.parent = node;
					node.parent.Right = node;
					x.Right = node.Right;
					if(node.Right != null)
						node.Right.parent = x;
					node.Right = x;
				}
		
				else
				{
					link x = node.parent;
					node.parent = x.parent;
					x.parent = node;
					node.parent.Left = node;
					x.Right = node.Right;
					if(node.Right != null)
						node.Right.parent = x;
					node.Left = x;
				}
			}
			else
			{
				link x = node.parent;
				node.parent = x.parent;
				x.Right = node.Left;
				node.Left = x;
				x.Right.parent = x;
				x.parent = node;
				root = node;
			}
		}
		inorderrec(root);
	}
	
	public void rotateRight(int key)
	{
		link node = searchNode(root, key);
		if(node != root)
		{
			if(node.parent.parent != null)
			{
				if(node.parent == node.parent.parent.Left)
				{
					link x = node.parent;
					node.parent = x.parent;
					x.parent = node;
					node.parent.Left = node;
					x.Left = node.Right;
					if(node.Right != null)
						node.Right.parent = x;
					node.Right = x;
				}
		
				else
				{
					link x = node.parent;
					node.parent = x.parent;
					x.parent = node;
					node.parent.Right = node;
					x.Left = node.Right;
					if(node.Right != null)
						node.Right.parent = x;
					node.Right = x;
				}
			}
			else
			{
				link x = node.parent;
				node.parent = x.parent;
				x.Left = node.Right;
				node.Right = x;
				x.Left.parent = x;
				if(node.Right != null)
					node.Right.parent = node;
				root = node;
			}
		}
		inorderrec(root);
	}

	public int size(link current)
	{  
		return current == null ? 0
	                          : size(current.Left)+size(current.Right)+1;
	}
    
    public int find_rank_node(link n)
    {
    	// find rank of a node
    	if(n ==null)
    		return 0;
    	else
    	{
    		int rank=0;
    		
    		link x=n;
    		int local=size(x.Left)+1; 
    		while(x.parent!=null)
    		 {
    			 if(x==x.parent.Right)
    				 break;
    			 x=x.parent;
    		 }
    		 rank=find_rank_node(x.parent);
    		 return rank+local;
    	}
    }
	
    public void containTree(link current, int i, int j)		
    {    	
    // check whether a subtree exists with elements only within rank i...j
    	
    	while(current != null)
    	{
    		int rank = find_rank_node(current);
    		if(rank >= i && rank <= j)
    		{
    			int size = size(current);
    			if(size == (j-i+1))
    			{
    				if(maximumNode(current).data == j && minimumNode(current).data == i)
    				{
    					test = true;
    					return;
    				}
    				break;
    			}
    		}
    		else if(rank >= j)
    			containTree(current.Left, i, j);
    		else
    			containTree(current.Right, i, j);
    		break;
    	}
    	System.out.println(test);
    		
    }
	 public static void preorderrec(link n)
	 {
	 	// preorder traversal
		 if (n != null)
		 {
			 System.out.println(n.data + " ");
			 preorderrec(n.getLeft());
			 preorderrec(n.getRight());
		 }
	 }
	 public static void inorderrec(link n)
	 {
	 	// inorder traversal
		 if (n != null)
		 {
			 //System.out.println(n.data);
			 inorderrec(n.Left);
			 System.out.println(n.data + " ");
			 inorderrec(n.Right);
		 }
	 }
	 public static void postorderrec(link n)
	 {
	 	// postorder traversal
		 if (n != null)
		 {
			 postorderrec(n.getLeft());
		  	 postorderrec(n.getRight());
		  	 System.out.println(n.data + " ");
		 }
	 }
	 
	 // traversals without recursion
	public void preorder() 
	{
		 if(root == null) 
			 return;
		 	 
		 Stack<link> stk = new Stack<link>();
		 stk.push(root);
		 	 
		 while(! stk.isEmpty()) 
		 {
			 link current = stk.pop();
			 if(current.Right != null) 
				 stk.push(current.Right);
		 	 if(current.Left != null) 
		 		 stk.push(current.Left);
		 	 System.out.println( current.data + " " );
		 }
	}
		 	 
	public void inorder() 
	{
		link node = root;
		Stack<link> stk = new Stack<link>();
		while(!stk.isEmpty() || node != null) 
		{
			if(node != null) 
			{
				stk.push(node);
		 	    node = node.Left;
		 	} 
			else 
			{
				node = stk.pop();
		 	    System.out.println(node.data + " ");
		 	    node = node.Right;
		 	}
		}
	}
		 	 
	public void postorder() 
	{
		if(root == null) 
			return;
		 	 
		Stack<link> stk = new Stack<link>();
		link current = root;
		 	 
		while(true) 
		{	
			if(current != null) 
			{
				if(current.Right != null) 
					stk.push(current.Right);
		 	    stk.push(current);
		 	    current = current.Left;
		 	    continue;
		 	}
		 	 
		 	if(stk.isEmpty()) 
		 		return;
		 	current = stk.pop();
		 	 
			if(current.Right != null && ! stk.isEmpty() && current.Right == stk.peek()) 
			{
				stk.pop();
		        stk.push(current);
		 	    current = current.Right;
		 	} 
			else 
			{
				System.out.print(current.data + " ");
		 	    current = null;
		 	}
		}
	}
}