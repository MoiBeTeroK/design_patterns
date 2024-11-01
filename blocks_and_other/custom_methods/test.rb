require "./my_array"

class Test
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def successful?
    raise "Метод successful? не был реализован в тесте #{@name}"
  end

  def test_result
    puts "Тест #{@name} завершился успешно." if successful?
    puts "Тест #{@name} провалился." unless successful?
  end
end

class TestCycle < Test
  def initialize()
    super("cycle")
  end

  def successful?
    arr = MyArray.new([1, 2, 3, 4])
    result = []
    arr.cycle(2) { |x| result << x }
    result == [1, 2, 3, 4, 1, 2, 3, 4]
  end
end

class TestEachSlice < Test
  def initialize(&block)
    super("each_slice")
  end

  def successful?
    arr = MyArray.new([1, 2, 3, 4])
    result = []
    arr.each_slice(3) { |slice| result << slice.to_a}
    result == [[1, 2, 3], [4]]
  end
end

class TestInject < Test
  def initialize()
    super("inject")
  end

  def successful?
    arr = MyArray.new([1, 2, 3, 4])
    result = arr.inject(0) { |acc, num| acc + num }
    result == 10
  end
end

class TestMaxBy < Test
  def initialize()
    super("max_by")
  end

  def successful?
    arr = MyArray.new(["apple", "banana", "strawberry", "date"])
    result = arr.max_by { |word| word.length }
    result == 'strawberry'
  end
end

class TestReject < Test
  def initialize()
    super("reject")
  end

  def successful?
    arr = MyArray.new([1, 4, 8, 7, 5, 3])
    result = arr.reject { |x| x.even? }
    result == [1, 7, 5, 3]
  end
end

class TestSortBy < Test
  def initialize()
    super("sort_by")
  end

  def successful?
    arr = MyArray.new(["apple", "banana", "strawberry", "date"])
    result = arr.sort_by { |word| word.length }
    result == ["date", "apple", "banana", "strawberry",]
  end
end


test1 = TestCycle.new()
test2 = TestEachSlice.new()
test3 = TestInject.new()
test4 = TestMaxBy.new()
test5 = TestReject.new()
test6 = TestSortBy.new()
test1.test_result
test2.test_result
test3.test_result
test4.test_result
test5.test_result
test6.test_result