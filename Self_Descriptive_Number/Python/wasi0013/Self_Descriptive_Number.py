def selfDescriptiveNumber(num):
	"""
	-- Self-Descriptive Number
	-- See: http://en.wikipedia.org/wiki/Self-descriptive_number

	-- Checks if the given number is self-descriptive
	-- num       :  a number, in base 10
	-- returns : true if the number is self-descriptive, false otherwise
	"""
	 
	sdNum=0 #create self-descriptive number
	
	base=1000000000
	
	digitCount=[0,0,0,0,0,0,0,0,0,0]

	for digit in str(num): digitCount[int(digit)]+=1
	
	for number in digitCount:
		sdNum+=number*base
		base/=10

	#check the given number with the created one   
	return (sdNum==num)

def main():
	#test
	print("6210001000 is self-descriptive number",selfDescriptiveNumber(6210001000))
	print("2110001000 is self-descriptive number",selfDescriptiveNumber(2110001000))


if __name__ == '__main__':
	main()