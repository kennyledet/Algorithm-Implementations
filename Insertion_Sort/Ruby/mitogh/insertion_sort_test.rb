require './insertion_sort.rb'

describe "#insertion_sort" do
    
  context "when order an array" do
    let(:unorder) { [3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1] } 

    it { expect(insertion_sort(unorder)).to eq unorder.sort }
  end
  
  context "when the array is empty" do
    it { expect(insertion_sort([])).to eq [] }
  end
end
