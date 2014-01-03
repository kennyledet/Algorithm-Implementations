require 'rspec'
require './shell_sort'

describe '#shell_sort' do
  context 'Not sorted' do
    let(:array) { ['S','O','R','T','E','X','A','M','P','L','E'] }

    it 'orders the array' do
      sorted_array = shell_sort(array)
      expect(sorted_array).to eq array.sort
    end
  end

  context 'Empty array' do
    let(:array) { @array = [] }

    it 'returns an empty array' do
      sorted_array = shell_sort(array)
      expect(sorted_array).to eq []
    end
  end
end
