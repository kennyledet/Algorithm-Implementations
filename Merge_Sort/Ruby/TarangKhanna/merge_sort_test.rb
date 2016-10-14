require './merge_sort'

describe "#merge_sort" do
  it "Sort The Array" do
    merge_sort([5,3,6,2,4]).should eq([2,3,3,5,6])
  end
end
