#Towers of Hanoi problem algorithm implementation
#See: http://en.wikipedia.org/wiki/Tower_of_Hanoi

func move(n,src,dest,temp){
 	if(n>=1){
    move(n-1,src,temp,dest);
    printf("Move %d -> %d\n",src,dest);
    move(n-1,temp,dest,src);
	}
}

BEGIN {
	print"Test run with values: 3,1,3,2";
	move(3,1,3,2);
}
END {
	print"The test was successful";
}