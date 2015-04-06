require './insertion_sort.rb'

describe "#insertion_sort" do
    
  context "when the array has one element" do
    it { expect(insertion_sort([1])).to eq [1]}
  end
  
  context "when the array has unorder elements" do
    let(:unorder) { [3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1] } 
    it { expect(insertion_sort(unorder)).to eq unorder.sort }
  end
  
  context "when the array has repeated elements" do
    let(:array){[0,0,0,0,0,0,00,0,0,0,0]}
    let(:copy){[0,0,0,0,0,0,00,0,0,0,0]}
    it { expect(insertion_sort(array)).to eq copy.sort }
  end

  context "when the array has order elements" do
    let(:array){ (1..10).to_a }
    let(:copy){ (1..10).to_a }
    it { expect(insertion_sort(array)).to eq copy}
  end
  
  context "when the array has order elements in reverse order" do
    let(:array){ (1..10).to_a.reverse }
    let(:copy){ (1..10).to_a.reverse }
    it { expect(insertion_sort(array)).to eq copy.sort}
  end
  
  context "when the array is empty" do
    it { expect(insertion_sort([])).to eq [] }
  end
end
