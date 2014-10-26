require './ackermann'

describe '#ackermann' do
  context 'When m = 0 and n = 0' do
    it{ expect(ackermann(0,0)).to eq 1 }
  end
  context 'When m = 0 and n = 1' do
    it{ expect(ackermann(0,1)).to eq 2 }
  end
  context 'When m = 0 and n = 2' do
    it{ expect(ackermann(0,2)).to eq 3 }
  end
  context 'When m = 2 and n = 2' do
    it{ expect(ackermann(2,2)).to eq 7 }
  end
  context 'When m = 3 and n = 2' do
    it{ expect(ackermann(3,2)).to eq 29 }
  end
  context 'When m = 3 and n = 5' do
    it{ expect(ackermann(3,5)).to eq 253 }
  end
end
