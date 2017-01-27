#include <string>
#include <iostream>

using namespace std;

string days[]={"first", "second", "third", "fourth", "fifth", "sixth",
  "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"};

string gifts[]={
	"A partridge in a pear tree.",
  	"Two turtle doves",
  	"Three french hens",
  	"Four calling birds",
  	"Five golden rings",
  	"Six geese a-laying",
  	"Seven swans a-swimming",
  	"Eight maids a-milking",
  	"Nine ladies dancing",
  	"Ten lords a-leaping",
  	"Eleven pipers piping",
  	"Twelve drummers drumming"
};

string twelve_days_of_xmas_song(int n) {
	if(n>12 || n<1){
		return "ERROR: The day number has to be within the [1..12] range :c";
	}

	string lyrics="";
	string aux;
	int j;
	while(n<=12){
		aux="On the "+days[n-1]+" day of Christmas,\n";
		aux+="My true love gave to me:\n";
		for(j=n; j>0; j--){
			aux+=gifts[j-1];
			if(j==2){
				aux+=" and";
			}
			aux+="\n";
		}
		aux+="\n";
		lyrics+=aux;
		n++;
	}
  	return lyrics;
}