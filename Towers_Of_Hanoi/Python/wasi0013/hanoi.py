"""
Towers of Hanoi problem algorithm implementation
See: http://en.wikipedia.org/wiki/Tower_of_Hanoi


"""
def move( n, src, dest, temp ):

	if n >= 1 : 
		move( n - 1, src, temp, dest )
	
		print( "Move %d -> %d" % (src, dest))

		move( n - 1, temp, dest, src )


def main():
	#test cases
	move(3,1,3,2)
	
if __name__ == "__main__":main()
