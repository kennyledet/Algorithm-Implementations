def euclidean_norm(p)
	return Math.sqrt(p.map { |n| n*n }.inject(:+))
end
