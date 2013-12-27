def fisher_yates(arr)
    m = arr.length
    while m != 0
        i = rand(m)
        m -= 1
        arr[i], arr[m] = arr[m], arr[i]
    end

    return arr
end

# arr = Proc.new { (1..3).to_a }
# d = Hash.new(0)
# 1000000.times { d[fisher_yates(arr.call).join ""] += 1 }
# p d