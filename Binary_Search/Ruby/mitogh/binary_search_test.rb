require './binary_search'

describe "#binary_search" do
  # A order array
  let(:array){ (1..100).to_a }

  context "Search in empty array" do
    it{ expect(binary_search([], 10)).to eq nil }
  end

  context "Search a not found needle in the haystack" do
    it{ expect(binary_search(array, 101)).to eq nil }
  end

  context "Search the first element" do
    it{ expect(binary_search(array, 1)).to eq 0 }
  end

  context "Search the middle element" do
    it{ expect(binary_search(array, 50)).to eq 49 }
  end

  context "Search the last element" do
    it{ expect(binary_search(array, 100)).to eq 99 }
  end

  context "Search without a needle" do
    it{ expect(binary_search(array)).to eq nil }
  end

  context "Search without a haystack" do 
    it{ expect(binary_search(nil,100)).to eq nil }
  end
end
