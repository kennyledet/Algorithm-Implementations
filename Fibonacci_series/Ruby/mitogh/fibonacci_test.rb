require './fibonacci'

describe "#fibonacci" do 

  context "When given 0" do
    it{ expect(fibonacci(0)).to eq 0}
  end
  
  context "When given 1" do
    it{ expect(fibonacci(1)).to eq 1}
  end

  context "When given 2" do
    it{ expect(fibonacci(1)).to eq 1}
  end

  context "When given 15" do
    it{ expect(fibonacci(14)).to eq 377}
  end
  
  context "When given 40" do
    it{ expect(fibonacci(40)).to eq 102334155}
  end

  context "When given no parameters" do
    it{ expect(fibonacci() ).to eq 0}
  end
end
