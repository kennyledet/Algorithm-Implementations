require './sieve.rb'

describe '#Sieve' do
  # First 100 numbers
  let(:primes){ sieve(1000) }


  context "When search for the number 2 as a prime number" do
    it{ expect(primes[2]).to eq true }
  end

  context "When search for the number 137 as a prime number" do
    it{ expect(primes[137]).to eq true }
  end

  context "When search for the number 233 as a prime number" do
    it{ expect(primes[233]).to eq true }
  end

  context "When search for the number 997 as a prime number" do
    it{ expect(primes[997]).to eq true }
  end

  context "When search for the number 1009 as a prime number" do
    it{ expect(primes[1009]).to be_nil  }
  end

  context "When search for the number 0 as a prime number" do
    it{ expect(primes[0]).to be_nil }
  end

  context "When search for the number 1 as a prime number" do
    it{ expect(primes[1]).to be_nil }
  end

  context "When search for the number 1000 as a prime number" do
    it{ expect(primes[1000]).to be_nil }
  end

  context "When the sieve has 1000000 numbers" do
    let(:primes){ sieve(1000000) }
    it "has only 78498 primes" do
    expect(primes.count(true)).to eq 78498
    end
  end
end
