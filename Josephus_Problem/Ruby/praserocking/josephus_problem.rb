# => iterative solution for josephus problem
# => the Josephus Problem (or Josephus permutation) is a theoretical problem related to a certain counting-out game.
def josephus(count,skip)
	x = 0
	i = 2
	while i <= count
		x = (x+skip) % i
		i += 1
	end
	return (x+1)
end

#test
def test_function(count,skip,answer)
	if josephus(count,skip) == answer
		puts "true"
	else
		puts "false"
	end
end

test_function(5,3,4)
test_function(7,4,2)
#wrong_case
test_function(7,4,3)