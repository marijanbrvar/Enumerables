module Enumerable
  def my_each
    return unless block_given?

    for i in self
      yield i
    end
  end

  def my_each_with_index
    return self unless block_given?

    idx = 0
    for i in self
      yield i, idx
      idx += 1
    end
  end

  def my_select
    return unless block_given?

    array = []
    my_each { |e| array << e if yield e }

    array
  end

  def my_all?
    return unless block_given?

    res = my_select { |e| yield e }
    length == res.length
  end

  def my_any?
    return unless block_given?

    res = my_select { |e| yield e }

    res.length.positive?
  end

  def my_none?
    return unless block_given?
    !my_any?
  end
end