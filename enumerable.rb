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

  def my_count(count = nil)
    retrun count if count
    return unless block_given?

    my_select { |n| yield n }.length
  end

  def my_map(my_proc = nil)
    array = []

    my_each { |n| array << my_proc.call(n) } if my_proc
    my_each { |n| array << yield(n) } if block_given?

    array
  end
end
