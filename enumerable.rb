module Enumerable
  def my_each
    return to_enum unless block_given?

    for i in self
      yield i
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    idx = 0
    for i in self
      yield i, idx
      idx += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    array = []
    my_each { |x| array << x if yield x }

    array
  end

  def my_all?(attr = nil, &block)
    return my_all_attr_check?(attr) unless attr.nil?

    return (my_all? { |e| !e.nil? && e != false }) unless block_given?

    my_select(&block).length.size
  end

  def my_all_attr_check?(attr)
    my_all? { |x| x.instance_of?(attr) } if attr.instance_of?(Class)
    my_all? { |x| x =~ attr } if attr.instance_of?(Regexp)
    my_all? { |x| x == attr }
  end

  def my_any?(attr = nil, &block)
    return my_any_attr_check?(attr) unless attr.nil?

    return (my_any? { |e| !e.nil? && e != false }) unless block_given?

    my_each(&block).length.positive?
  end

  def my_any_attr_check?(attr)
    my_any? { |x| x.instance_of?(attr) } if attr.instance_of?(Class)
    my_any? { |x| x =~ attr } if attr.instance_of?(Regexp)
    my_any? { |x| x == attr }
  end

  def my_none?(attr = nil)
    return my_none_attr_check?(attr) unless attr.nil?

    return (my_any? { |e| !e.nil? && e != false }) unless block_given?

    !my_any?
  end

  def my_none_attr_check?(attr)
    my_none? { |x| x.instance_of?(attr) } if attr.instance_of?(Class)
    my_none? { |x| x =~ attr } if attr.instance_of?(Regexp)
    my_none? { |x| x == attr }
  end

  def my_count(attr = nil, &block)
    return my_count { |x| x == attr } unless attr.nil?
    return (my_count { |_x| true }) unless block_given?

    my_select(&block).length
  end

  def my_map(my_proc = nil)
    return to_enum unless block_given?

    array = []
    my_each { |x| array << my_proc.call(x) } if my_proc
    my_each { |x| array << yield(x) } if block_given?

    array
  end

  def my_inject(attr = nil)
    my_each { |x| attr = attr.nil? ? x : yield(attr, x) }
    memo
  end
end

def multiply_els(array)
  array.my_inject { |total, x| total * x }
end
