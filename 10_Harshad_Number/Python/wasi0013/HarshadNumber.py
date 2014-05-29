"""
Harshad Number implementation
See: http://en.wikipedia.org/wiki/Harshad_number
"""
def sum_digits(n):
    result=0
    while n:
        result+=n%10
        n//=10
    return result

#returns True if n is harshad number or False otherwise
def is_harshad(n): return (n%sum_digits(n)==0)

    
def main():
    # test contains a set of harshad numbers
    test=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
          12, 18, 20, 21, 24, 27, 30, 36,
          40, 42, 45, 48, 50, 54, 60, 63,
          70, 72, 80, 81, 84, 90, 100, 102,
          108, 110, 111, 112, 114, 117, 120,
          126, 132, 133, 135, 140, 144, 150,
          152,153, 156, 162, 171, 180, 190,
          192, 195, 198, 200, 201]
    
    flag=True
    for i in test:
    	if not is_harshad(i):
    		flag=False
    		break
    print("The test was", "Successful"if flag else "Unsuccessful!");


if __name__ == '__main__':
	main()
