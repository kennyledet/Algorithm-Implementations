require './euclidean.rb'

describe "#gcd_divsion" do
  context "Test GCD of 210 and 45" do
    it{ gcd_division(210,45).should eq(15) }
  end
  context "Test GCD of 0 and 0" do
    it{ gcd_division(0,0).should eq(0) }
  end
  context "Test GCD of 20 and 97" do
    it{ gcd_division(20,77).should eq(1) }
  end
end

describe "#gcd_substraction" do
  context "Test GCD of 210 and 45" do
    it{ gcd_substraction(210,45).should eq(15) }
  end
  context "Test GCD of 0 and 0" do
    it{ gcd_substraction(0,0).should eq(0) }
  end
  context "Test GCD of 20 and 97" do
    it{ gcd_substraction(120,77).should eq(1) }
  end
end

describe "#gcd_divsion" do
  context "Test GCD of 210 and 45" do
    it{ gcd_recursive(210,45).should eq(15) }
  end
  context "Test GCD of 0 and 0" do
    it{ gcd_recursive(0,0).should eq(0) }
  end
  context "Test GCD of 20 and 97" do
    it{ gcd_recursive(20,77).should eq(1) }
  end
end
