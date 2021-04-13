require_relative '../enumerable'

describe '#my_each' do
  describe 'when block is given' do
    it 'executes each element inside the array' do
      array = []
      %w[1,2,3,4,5].my_each { |element| array << element }
      expect(array).to eq(%w[1,2,3,4,5])
    end
  end
  describe 'when no block is given' do
    it 'it will return Enumerator' do
      array = [1, 2, 3, 4]
      expect(array.my_each).to be_a(Enumerator)
    end
  end
end
