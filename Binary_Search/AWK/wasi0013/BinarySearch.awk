// Implementation of Binary Search Algorithm
// This algorithm expects the Passed array is already sorted

func BinarySearch(array,len,target){  


 	low=0;
 	high=len;
 	while(low<high){
             	    
        mid=int((low+high)/2);
             	    
        if(array[mid]==target) return mid;             		
        
        else if(array[mid]>target)high=mid-1;
        
        else low=mid+1;
    }
    return high;
}

BEGIN {
	print"Beginning Test...";

}
END {

    //creating a test array [1,2,3,4,5,6,7,8,9]
    for(i=0;i<10;i++) arr[i]=i+1;

    ind=BinarySearch(arr,10,7);
    if(arr[ind]==7) print"The Test was successful";

}