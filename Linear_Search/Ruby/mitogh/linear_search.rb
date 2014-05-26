def linear_search(arr = [], key = nil)
    arr.each do |element|
        return true if element == key
    end
    return nil
end
