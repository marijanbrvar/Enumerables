# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

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
    if block_given? || attr.nil?
      helper = block_given? ? block : proc { |v| v }
      my_each { |v| return false unless helper.call(v) }
    else
      my_each { |v| return false unless check_pattern?(v, attr) }
    end
    true
  end

  def my_any?(attr = nil)
    return check_my_any?(attr) unless attr.nil?

    return (my_any? { |x| !x.nil? && x != false }) unless block_given?

    my_each do |value|
      return true if yield value
    end
    false
  end

  def check_my_any?(attr)
    case attr
    when attr.instance_of?(Class) then my_any? { |x| x.instance_of?(attr) }
    when attr.instance_of?(Regexp) then my_any? { |x| x =~ attr }
    else my_any? { |x| x == attr }
    end
  end

  def my_none?(attr = nil)
    return my_none_attr_check?(attr) unless attr.nil?

    return (my_any? { |e| !e.nil? && e != false }) unless block_given?

    !my_any?
  end

  def my_none_attr_check?(attr)
    !my_none? { |x| x.instance_of?(attr) } if attr.instance_of?(Class)
    !my_none? { |x| x =~ attr } if attr.instance_of?(Regexp)
    !my_none? { |x| x == attr }
  end

  def my_count(attr = nil, &block)
    return my_count { |x| x == attr } unless attr.nil?
    return (my_count { |_x| true }) unless block_given?

    my_select(&block).length
  end

  def my_map(my_proc = nil)
    return to_enum unless block_given?

    array = []
    my_each { |x| array << my_proc.call(x) } if my_proc && block_given?
    my_each { |x| array << yield(x) } if block_given?

    array
  end

  def my_inject(attr = nil, sym = nil, &block)
    attr = attr.to_sym if attr.is_a?(String) && !sym && !block
    if attr.is_a?(Symbol) && !sym
      block = attr.to_proc
      attr = nil
    end
    sym = sym.to_sym if sym.is_a?(String)
    block = sym.to_proc if sym.is_a?(Symbol)

    my_each { |x| attr = attr.nil? ? x : block.yield(attr, x) }
    attr
  end
end

def check_pattern?(value, patt)
  return true if patt.is_a?(Class) && value.is_a?(patt)
  return true if patt.is_a?(Regexp) && value =~ patt
  return true if value == patt
end

def multiply_els(array)
  array.my_inject { |total, x| total * x }
end


# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
