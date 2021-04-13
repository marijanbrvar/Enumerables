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
  describe 'my_each_with_index' do
    describe 'when block is given' do
      it 'excutes each element with its index' do
        array = []
        sample = %w[a b c]
        sample.my_each_with_index { |ele, idx| array[idx] = ele }
        expect(array).to eq(%w[a b c])
      end
    end
  end
  describe 'my_each_with_index' do
    describe 'when no block is given' do
      it 'It will return Enumerator' do
        array = %w[a b c]
        expect(array.my_each_with_index).to be_a(Enumerator)
      end
    end
  end
end
