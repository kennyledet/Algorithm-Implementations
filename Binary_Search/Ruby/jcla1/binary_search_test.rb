require './binary_search'

describe "#binary_search" do
  context "Test empty array" do
    it{ binary_search([], 1).should eq(-1) }
  end

  context "Search last key" do 
    it{ binary_search([1,2,3,4,5], 5).should eq(4)}
  end

  context "Search first key" do 
    it{ binary_search([1,2,3,4,5], 1).should eq(0)}
  end

  context "Search middle key" do 
    it{ binary_search([1,2,3,4,5], 3).should eq(2)}
  end

  context "Search not found key" do 
    it{ binary_search([1,2,3,4,5], 10).should eq(-1)}
  end
end
