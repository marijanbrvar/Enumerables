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
  describe 'my_all?' do
    context 'when block is given' do
      it 'returns true if all conditions are met' do
        array = [1, 2, 3, 5]
        result = array.my_all? { |elem| elem.is_a?(Integer) }
        expect(result).to eq true
      end
      it 'returns false if all conditions are not met' do
        array = [1, 2, 3, 5, 'str']
        result = array.my_all? { |elem| elem.is_a?(Integer) }
        expect(result).to eq false
      end
    end

    context 'when parameter is given' do
      it 'should return true' do
        array = [1, 2, 3]
        expect(array.my_all?(Integer)).to be true
      end
      it 'should return false' do
        array = [1, 1, 1, 'str']
        expect(array.my_all?(Integer)).to be false
      end
      it 'should return true if empty' do
        expect([].my_all?).to be true
      end
    end

    context 'when parameter is not given' do
      it 'should return true' do
        array = [1, 2, 3]
        expect(array.my_all?).to be true
      end
      it 'should return false' do
        array = [1, 2, 3, nil]
        expect(array.my_all?).to be false
      end
    end
  end

  describe 'my_any?' do
    context 'when block is given' do
      it 'should return true if any param meets condition' do
        arr = [1, 2, 3, 4, 5]
        expect(arr.my_any? { |num| num > 3 }).to eq(true)
      end
      it 'should return false if any param meets condition' do
        arr = [8, 9, 10, 11]
        expect(arr.my_any? { |num| num < 5 }).to eq(false)
      end
    end

    context 'when parameter is given' do
      it 'returns true when any element meet the condition' do
        result = %w[a b c]
        expect(result.my_any?(String)).to eq true
      end

      it 'returns false when any elements do not meet the condition' do
        result = [2, 4, 6, 8]
        expect(result.my_any?(String)).to eq false
      end
    end

    context 'when parameter is not given' do
      it 'returns true if any truthy elements' do
        expect([1, 2, 3, 'str'].my_any?).to eq true
      end
      it 'returns false if all falsy elements' do
        expect([nil, false].my_any?).to eq false
      end
    end
  end

  describe 'my_none' do
    context 'when block is given' do
      it 'returns true if no elements meet the condition' do
        sample = [1, 2, 3]
        expect(sample.my_none? { |n| n > 3 }).to eq(true)
      end
      it 'returns false if any elements meet the condition' do
        sample = [1, 2, 3, 4]
        expect(sample.my_none? { |n| n > 2 }).to eq(false)
      end
    end
    context 'when parameter is given' do
      it 'returns true if no param meet the condition' do
        expect([Integer, nil].my_none?(String)).to eq(true)
      end
      it 'returns false if any param meet the condition' do
        expect(['hello', 2].my_none?(String)).to eq(false)
      end
    end
    context 'should return false if any truthy elements' do
      it 'returns false' do
        expect([1, true, false].my_none?).to eq false
      end
      it 'should return true if no truthy elements' do
        expect([nil, false].my_none?).to eq true
      end
    end
  end

  describe 'my_count' do
    context 'when block is given' do
      it 'should return the number of the elements matching the condition' do
        arr = [1, 2, 3]
        expect(arr.my_count { |counter| counter > 2 }).to eq(1)
      end
      it 'should return the number zero if no elements matching the condition' do
        expect([1, 2, 3].my_count { |counter| counter > 3 }).to eq(0)
      end
    end
    context 'when parameter is given' do
      it ' returns the number of the elements in block matching parameter condition' do
        expect([1, 2, 3, 'el'].my_count(Integer)).to eq(0)
      end
      it ' returns the number zero if no elements in block match the parameter condition' do
        expect([false, 'two'].my_count(Integer)).to eq(0)
      end
    end
    context 'when param is not given' do
      it 'returns array length when parameter is absent' do
        expect(%w[a b c].my_count).to eq(3)
      end
      it 'returns zero for empty array' do
        expect([].my_count).to eq(0)
      end
    end
  end

  describe 'my_map' do
    context ' when block is given' do
      it 'should return a new array after mapping all the elements in the orginal array' do
        expect([1, 2, 3].my_map { |element| element + 2 }).to eq [3, 4, 5]
      end
    end
    context 'when block is not given' do
      it 'should return enumerator' do
        expect([1, 2, 3].my_map).to be_a(Enumerator)
      end
    end
  end

  describe 'my_inject' do
  it 'calls LocalJumpError' do
    expect { [1, 2, 3].my_inject }.to raise_error LocalJumpError
  end

  context 'when block is given' do
    context 'when parameter is given' do
      it ' should return sum of all elements in array starting from parameter' do
        expect([1, 2, 3].my_inject(5) { |sum, value| sum + value }).to eq(11)
      end
      context 'when parameter is not given' do
        it ' should return sum of all elements in array' do
          expect([1, 2, 3].my_inject { |sum, value| sum + value }).to eq(6)
        end
      end
    end
  end
  context 'when block is not given, starting point & symbol is given' do
    it 'should return sum of arr elements starting from param' do
      expect([1, 2, 3].my_inject(5, :+)).to eq(11)
    end
  end
  context 'when block is not given,only symbol is given' do
    it 'should return sum of arr elements ' do
      expect([1, 2, 3].my_inject(:+)).to eq(6)
    end
  end
end
end

