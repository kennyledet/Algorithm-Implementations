def counting_sort(array = [])
  # Search the maximum value
  max = array.max
  max ||= 0

  # Create an array with 0 to max elements with zero
  aux = Array.new(max, 0)

  # Do the count
  array.each do |element|
    aux[element] = aux[element].to_i + 1
  end

  # The new order array
  order = []
  # Fill the new array
  aux.each.with_index do |element, index|
      element.times do 
          order << index
      end
  end
  return order
end
