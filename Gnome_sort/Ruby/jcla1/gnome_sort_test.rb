
require_relative "./gnome_sort"

describe "#gnome_sort" do
  it "Sorts empty array" do
    arr = []
    gnome_sort(arr).should eq(arr)
  end

  it "Returns unchanged array with 1 element" do
    arr = [1]
    gnome_sort(arr).should eq(arr)
  end

  it "Sorts array" do
    arr = [9, 4, 6, -2, 6, -10, 592, 41]
    gnome_sort(arr).should eq(arr.sort)
  end
end
