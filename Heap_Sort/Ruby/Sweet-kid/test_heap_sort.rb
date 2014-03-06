require_relative 'heap_sort'
require 'test/unit'

class TestHeapSort < Test::Unit::TestCase

  def test_heap_sort
    array = [ 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 ]
    expected = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
    hs = HeapSort.new(array)
    assert_equal( expected, hs.array , "Array is sorted." )
  end
end
