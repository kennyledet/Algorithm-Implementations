# This implementation is loosely based on Sedwick and Waynes selection sort from
# fourth edition of the quite amazing "Algorithms" text book. It is rewritten
# from Java to Ruby.

def selection_sort(array)
  array.each_with_index do |item, i|
    min = i
    i.upto(array.length-1) do |j|
      min = j if array[j] < array[min]
    end
    array[i], array[min] = array[min], array[i]
  end
  array
end
