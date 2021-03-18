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

    res = my_select do |e|
      return yield e
    end
    length == res.length
  end

  def my_any?
    return unless block_given?

    res = my_select do |e|
      return yield e
    end

    res.length.positive?
  end

  def my_none?
    return unless block_given?

    !my_any?
  end

  def my_count(count = nil)
    return count if count
    return length unless block_given?

    res = my_select.length do |n|
      return yield n
    end

    res.length
  end

  def my_map(my_proc = nil)
    array = []

    my_each { |n| array << my_proc.call(n) } if my_proc
    my_each { |n| array << yield(n) } if block_given?

    array
  end

  def my_inject(*arguments)
    p arguments.length
    case arguments.length
    when 1 then arguments.first.is_a?(Symbol) ? s = arguments.first : res = arguments.first
    when 2 then res, s = arguments.first, arguments.last
    end

    res ||= 0

    my_each { |x| res = block_given? ? yield(res, x) : res.send(s, x) }

    res
  end

  def my_multiply_els
    my_inject(1, :*)
  end
end
