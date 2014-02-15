require './binary_search'

describe "#binary_search" do
  it "Test empty array" do
    binary_search([], 1).should eq(-1)
  end

  it "Search last key" do
    binary_search([1,2,3,4,5], 5).should eq(4)
  end

  it "Search first key" do
    binary_search([1,2,3,4,5], 1).should eq(0)
  end

  it "Search middle key" do
    binary_search([1,2,3,4,5], 3).should eq(2)
  end

  it "Search not found key" do
    binary_search([1,2,3,4,5], 10).should eq(-1)
  end
end
