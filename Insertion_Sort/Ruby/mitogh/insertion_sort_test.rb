require './insertion_sort.rb'

describe "#insertion_sort" do
    
  context "Test unorder array" do
    before(:each) { @unorder = [3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1] } 

    it "should order the array" do
        insertion_sort(@unorder).should eq @unorder.sort
    end

    it "should return [] with empty array" do
        insertion_sort([]).should eq []
    end
  end
end
