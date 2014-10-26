func bottle(){
  bottles = 99;
  while(bottles > 0){
    printf("%d bottles of beer on the wall, %d bottles of beer.\n",bottles,bottles);
    bottles--;
    print("Take one down and pass it around,",(bottles > 0) ?bottles:"no more" ,"bottles of beer on the wall.");
  }
  print("No more bottles of beer on the wall, no more bottles of beer.");
  print("Go to the store and buy some more, 99 bottles of beer on the wall.");
}



BEGIN {
     #run the program
	bottle();
}
END {

}
