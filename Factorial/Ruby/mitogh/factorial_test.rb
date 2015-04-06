require './factorial'

describe "#factorial" do
  context "When given 0" do
    it "returns 1" do 
        expect(factorial(0)).to eq 1
    end
  end
  context "When given 5" do
    it "returns 120" do 
        expect(factorial(5)).to eq 120
    end
  end
end

describe "#factorial_iterative" do
  context "When given 0" do
    it "returns 1" do 
        expect(factorial_iterative(0)).to eq 1
    end
  end
  context "When given 5" do
    it "returns 120" do 
        expect(factorial_iterative(5)).to eq 120
    end
  end
end
