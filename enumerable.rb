module Enumerable
  def my_each
    return unless block_given?

    for i in self
      yield i
    end
  end
end
