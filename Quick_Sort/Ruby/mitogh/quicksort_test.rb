require "./quicksort.rb"

describe "#quicksort" do

  context "when the array is empty" do
    it { expect(quicksort([])).to eq []}
  end

  context "when the array has one element" do
    it { expect(quicksort([1])).to eq [1]}
  end

  context "when the array has unorder elements" do
    let(:array){ [12321,43535,2342423,4364576,2343323,3534534,212,1,2,0,234234,234,34] }
    let(:copy){ [12321,43535,2342423,4364576,2343323,3534534,212,1,2,0,234234,234,34] }
    it { expect(quicksort(array)).to eq copy.sort }
  end

  context "when the array has order elements" do
    let(:array){ (1..10).to_a }
    let(:copy){ (1..10).to_a }
    it { expect(quicksort(array)).to eq copy}
  end

  context "when the array has order elements in reverse order" do
    let(:array){ (1..10).to_a.reverse }
    let(:copy){ (1..10).to_a.reverse }
    it { expect(quicksort(array)).to eq copy.sort}
  end
end
