require "test/unit"
require_relative "floyd_warshall"
 
class TestFloydWarshall < Test::Unit::TestCase
 
  def test_simple
    input = [[0,2,1],[4,0,10],[1,1,0]]
    output = [[0,2,1],[4,0,5],[1,1,0]]
    assert_equal(output, FloydWarshall.new.floyd_warshall(input,3))
  end
 
end