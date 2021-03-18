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
end
