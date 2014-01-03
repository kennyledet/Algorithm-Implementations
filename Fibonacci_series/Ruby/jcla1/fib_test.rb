require 'rspec'
require './fib'

describe '#fib(n)' do
  context 'When given 0' do
    let(:value) { fib(0) }

    it 'returns 0' do
      expect(value).to eq 0
    end
  end

  context 'When given 33' do
    let (:value) { fib(33) }

    it 'returns 3524578' do
      expect(value).to eq 3524578
    end
  end
end

describe '#fib_tco(n, a=0, b=1)' do
  context 'When given 0' do
    let(:value) { fib_tco(0) }

    it 'returns 0' do
      expect(value).to eq 0
    end
  end

  context 'When given 33' do
    let(:value) { fib_tco(33) }

    it 'returns 3524578' do
      expect(value).to eq 3524578
    end
  end
end

describe '#fib_loop(n)' do
  context 'When given 0' do
    let(:value) { fib_loop(0) }

    it 'returns 0' do
      expect(value).to eq 0
    end
  end

  context 'When given 33' do
    let(:value) { fib_loop(33) }

    it 'returns 3524578' do
      expect(value).to eq 3524578
    end
  end
end
