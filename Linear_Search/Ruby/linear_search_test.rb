require './linear_search'

describe "linear_search test" do
  it "empty array" do
    linear_search([], 1).should eq(-1)
  end

  it "Search for an element in array" do
    linear_search([1,3,4,10,32], 10).should eq(3)
  end
end