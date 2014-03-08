class HeapSort

  attr_reader :array
  def initialize(array)
    @array = array
    heap_sort()
  end

  def heap_sort
    build_max_heap()
    loop_over = (1..(@array.length - 1)).to_a.reverse
    heap_size = @array.length
    for i in loop_over
      temp = @array[ 0 ]
      @array[ 0 ] = @array[ i ]
      @array[ i ] = temp
      heap_size -= 1
      max_heapify( 0, heap_size )
    end
  end

  def build_max_heap()
    upper = @array.length / 2 - 1
    loop_over = ( 0..upper).to_a.reverse
    for i in loop_over
      max_heapify( i, @array.length )
    end
  end

  def max_heapify( i, size )
    l = left( i )
    r = right( i )

    largest = i
    if( l < size and @array[ l ] > @array[ i ] )
      largest = l
    end

    if( r < size and @array[ r ] > @array[ largest ] )
      largest = r
    end

    if( largest != i )
      temp = @array[ i ]
      @array[ i ] = @array[ largest ]
      @array[ largest ] = temp
      max_heapify( largest, size )
    end
  end

  def parent( i )
    return ( i + 1 ) / 2 - 1
  end

  def left( i )
    return 2 * i + 1
  end

  def right( i )
    return 2 * i + 2
  end

  def print_array
    for i in @array
      print i, " "
    end
    puts "\n"
  end

end
