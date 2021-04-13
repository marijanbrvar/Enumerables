require_relative '../enumerable'

describe '#my_each' do
  context 'when block is given' do
    it 'executes each element inside the array' do
      array = []
      %w[1,2,3,4,5].my_each { |element| array << element }
      expect(array).to eq(%w[1,2,3,4,5])
    end
  end
  context 'when no block is given' do
    it 'it will return Enumerator' do
      array = [1, 2, 3, 4]
      expect(array.my_each).to be_a(Enumerator)
    end
  end
  describe 'my_each_with_index' do
    context 'when block is given' do
      it 'excutes each element with its index' do
        array = []
        sample = %w[a b c]
        sample.my_each_with_index { |ele, idx| array[idx] = ele }
        expect(array).to eq(%w[a b c])
      end
    end
  end
  describe 'my_each_with_index' do
    context 'when no block is given' do
      it 'It will return Enumerator' do
        array = %w[a b c]
        expect(array.my_each_with_index).to be_a(Enumerator)
      end
    end
  end
  describe 'my_select' do
    context 'when block is given' do
      it 'return array with each element passing the block' do
        array = []
        sample = [1, 2, 3, 4, 5, 6]
        sample.my_select { |elem| array << elem if elem.even? }
        expect(array).to eq([2, 4, 6])
      end
    end
  end
  describe 'my_select' do
    context 'when no block is given' do
      it 'It will return Enumerater' do
        sample = [1, 2, 3, 4, 5, 6]
        expect(sample.my_select).to be_a(Enumerator)
      end
      it 'should return an empty array if block condition is not true' do
        arr = [1, 2, 3, 4, 5]
        expect(arr.my_select { false }).to be_empty
      end
    end
  end
end
