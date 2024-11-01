class MyArray
  def initialize(array)
    @array = array.dup.freeze
  end

  def cycle(n = nil, &block)
    raise ArgumentError, "Блок не был передан" unless block_given?
    return [] if @array.empty?

    new_size = n ? n * @array.size : nil
    count = 0

    loop do
      @array.each do |element|
        yield element
        count += 1
      end
      break if n && count >= new_size
    end
  end

  def each_slice(n = nil, &block)
    raise ArgumentError, "Блок не был передан" unless block_given?
    return [] if @array.empty?

    @array.each_with_index do |element, index|
      if index % n == 0
        slice = @array[index, n]
        yield MyArray.new(slice) unless slice.empty?
      end
    end
  end

  def inject(start = nil, &block)
    raise ArgumentError, "Блок не был передан" unless block_given?
    return nil if @array.empty?
    accumulator = start.nil? ? @array.first : start

    @array.each do |element|
      accumulator = block.call(accumulator, element)
    end
    accumulator
  end

  def max_by(&block)
    raise ArgumentError, "Блок не был передан" unless block_given?
    return nil if @array.empty?

    max_element = @array.first
    max_value = yield(max_element)

    @array.each do |element|
      value = yield(element)
      if value > max_value
        max_value = value
        max_element = element
      end
    end
    max_element
  end

  def reject(&block)
    raise ArgumentError, "Блок не был передан" unless block_given?
    return [] if @array.empty?
    result = []

    @array.each do |element|
      unless yield(element)
        result << element
      end
    end
    result
  end

  def sort_by(&block)
    raise ArgumentError, "Блок не был передан" unless block_given?
    return [] if @array.empty?

    sorted_array = []

    @array.each do |element|
      index = 0
      while index < sorted_array.size && yield(sorted_array[index]) <= yield(element)
        index += 1
      end
      sorted_array.insert(index, element)
    end
    sorted_array
  end

  def to_a
    @array
  end
end