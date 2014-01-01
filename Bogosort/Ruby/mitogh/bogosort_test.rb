require './bogosort.rb'

describe "#bogosort" do
  context "Test empty array" do
    it{ expect(bogosort([])).to eq([]) }
  end

  context "Test to order array" do
    let(:unorder){ [3, 2, 1] } 
    it{ expect(bogosort(unorder)).to eq (unorder.sort) }
  end
end
