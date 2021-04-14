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

  def my_any?(attr = nil, &block)
    if block_given? || attr.nil?
      helper = block_given? ? block : proc { |v| v }
      my_each { |v| return true if helper.call(v) }
    else
      my_each { |v| return true if check_pattern?(v, attr) }
    end
    false
  end

  def my_none?(attr = nil)
    if block_given?
      my_each { |v| return false if yield(v) }
      return true
    end
    unless attr.nil?
      my_each { |v| return false if check_pattern?(v, attr) }
      return true
    end
    !my_any?
  end

  def my_count(attr = nil, &block)
    return my_count { |x| x == attr } unless attr.nil?
    return (my_count { |_x| true }) unless block_given?

    my_select(&block).length
  end

  def my_map(proc = nil, &block)
    return map_helper(proc) unless proc.nil?
    return map_helper(block) if block_given?

    to_enum
  end

  def my_inject(*args, &block)
    array = to_a

    return inject_helper(array, args, block) if block_given?

    raise LocalJumpError, 'no block given' if args.empty?

    n = args.size == 2 ? args[0] : array[0]
    sym = args.size == 2 ? args[1] : args[0]
    idx = args.size == 2 ? 0 : 1

    (idx...array.size).my_each { |x| n = n.send(sym, array[x]) }

    n
  end
end

def inject_helper(array, args, block)
  n = args.empty? ? array[0] : args[0]
  idx = args.empty? ? 1 : 0

  (idx...array.size).my_each { |x| n = block.call(n, array[x]) }

  n
end

def map_helper(value)
  new_array = []
  my_each { |x| new_array << value.call(x) }
  new_array
end

def check_pattern?(value, patt)
  return true if patt.is_a?(Class) && value.is_a?(patt)
  return true if patt.is_a?(Regexp) && value =~ patt
  return true if value == patt
end

def multiply_els(array)
  array.my_inject { |total, x| total * x }
end
