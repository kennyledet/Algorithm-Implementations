def levenshtein(string_a = "", string_b = "")
  # Size of the two strings
  len_a = string_a.size
  len_b = string_b.size

  # Return the length of the unique array if is only 
  # one parameter
  return len_b if len_a == 0
  return len_a if len_b == 0
  
  # Hash for the values
  map =  Hash.new(0)
  
  # Loop on all the elements of string_a to fill map
  for i in 1..len_a do
    map[[i, 0]] = i 
  end
  # Loop on all the elements of string_b to fill map
  for j in 1..len_b do 
    map[[0, j]] = j 
  end

  # Iterate over the whole map
  for i in 1..len_a do
    for j in 1..len_b  do
      # Check the cost
      cost = (string_a[i-1] == string_b[j-1]) ? 0 : 1;
      # Clean and readable way for the variables
      deletion = map[[i-1, j]] + 1
      insertion = map[[i, j-1]] + 1
      substitution = map[[i-1, j-1]] + cost
      # Fill with the minimum value
      map[[i,j]] = [deletion, insertion, substitution].min
    end
  end
  return map[[len_a, len_b]]
end
