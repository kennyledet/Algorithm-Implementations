# Harshad Number implementation
# See: http://en.wikipedia.org/wiki/Harshad_number

func sumdigits(n){
    result=0;

    while(n){
        
        result+=(n%10);
        n=int(n/10);
    
    }
    
    return result;
}

#Test wheather a number is harshad number or not
func isharshad(n){
    return n%sumdigits(n)==0;
}


BEGIN {
  
  print("Testing for Harshad Numbers");
  count=0;

  #There are 33 harshad numbers in the range 1-100
  for(i=1;i<101;i++){
      #count = count + 1 if harshad number else count + 0
      count+= isharshad(i) ? 1 : 0 ;
  }

}
END {

 print("The test was ",count==33?"Successful":"Unsuccessful");



}