from math import log

"""
-- Various average (means) algorithms implementation
-- See: http://en.wikipedia.org/wiki/Average
-- Returns the sum of a sequence of values

"""

#Calculates the arithmetic mean of the list numbers and returns the result

def arithmetic_mean(numbers): return float(sum(numbers))/len(numbers)


#Calculates the geometric mean of the list numbers
def geometric_mean(numbers):
	
	product=1
	
	for num in numbers: 
		
		product*=num
	
	return pow(product,1.0/len(numbers))

#Calculates the harmonic mean of the list numbers

def harmonic_mean(numbers):
	
	return float(len(numbers))/sum([1.0/num for num in numbers])

#Calculates the quadratic mean of the list numbers

def quadratic_mean(numbers):
	
	return ((1.0/len(numbers))*sum([num*num for num in numbers]))**.5

# Calculates the generalized mean of the list numbers according to the
# given power
	
def generalized_mean(numbers,power):

	return (( 1.0/len(numbers))*sum([num**power for num in numbers]))**(1.0/power)
	
# Calculates weighted sum where weights and values are two list with equal number
# of elements

def weighted_mean(values,weights):

	if(len(values)!= len(weights)): print("List lengths don't match")

	else:

		sumup=0

		for counter,number in enumerate(values):

			sumup+=number*weights[counter]
			
		return float(sumup)/sum(weights)

# Calculates midrange_mean

def midrange_mean(values):

	return 0.5*(min(values)+max(values))

# Calculates midrange_mean

def energatic_mean(values):

	sumup=sum([10**(num/10.0) for num in values])
	
	return 10*log((1.0/len(values))*sumup, 10)


def main():
	
	values =[1,2,3,4,5]
	
	weights = [0.1, 0.2, 0.2, 0.3, 0.2]
	
	flag =True
	
	if(arithmetic_mean(values)!=3):
	
		flag = False
	
	elif(geometric_mean(values)!=2.605171084697352):
	
		flag = False
	
	elif(harmonic_mean(values)!=2.18978102189781):
	
		flag = False
	
	elif(quadratic_mean(values)!=3.3166247903554):
	
		flag = False
	
	elif(generalized_mean(values,1)!=arithmetic_mean(values)):
	
		flag = False
	
	elif(weighted_mean(values,weights) != 3.3):
	
		flag = False	
	
	elif(midrange_mean(values)!=3):
	
		flag = False
	
	elif(energatic_mean(values)!=  3.2276678141732704):
	
		flag = False
	
	print("Test is"+(" Successful"if(flag) else" Unsuccessful"))

if __name__ == '__main__':
        main()	
