//Program reads in a decimal, converts it to a fraction, then simplifies it

#include <iostream>
#include <iomanip>
#include <string>
#include <stdlib.h>

using namespace std;

//function prototypes
void convert(string, float&	, float&);
void simplify(float&, float&);

int main()
{
	//declare decimal as a string
	//declare seperate variables for the numerator and denominator
	string decimal;
	float numerator = 0;
	float denominator = 1;
	
	//Read in a decimal from the user
	cout << "Enter a decimal" << endl; 
	cin >> decimal; 

	//call conversion function
	convert(decimal, numerator, denominator);

	//call simplification function
	simplify(numerator, denominator);

	//print the simplified fraction
	cout << fixed << setprecision(0);
	cout << "Fraction: " << numerator << "/" << denominator << endl;

	return 0;
}

//function converts the decimal to a fraction
void convert(string dec, float& numer, float& denom)
{
	float num;
	int point = dec.find("."); //finds where the decimal point is
	int length;

	string afterP = dec.substr((point + 1), (dec.length() - 1 ));//gets everything after the decimal point
	length = afterP.length();//determines how many characters are after the point

	numer = atof(dec.c_str());//converts the decimal from a string to a float

	//this loop moves the decimal point
	for (; length > 0; length--)
	{
		numer *= 10.0;
		denom *= 10.0;
	}

}

//function simplifies the fraction
void simplify(float& numer, float& denom)
{
	int num = 9;
	bool isDivisible;

	if (int(numer) % int(denom) == 0)
	{
		numer /= denom;
		denom = 1;
		return;
	}
	
	for (;num > 0; num--)
	{
		isDivisible = ((int(numer) % num == 0) && (int(denom) % num == 0));

		if (isDivisible)
		{
			numer /= num;
			denom /= num;
		}
	}

}