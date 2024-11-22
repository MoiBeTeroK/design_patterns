require "./my_array"
require 'minitest/autorun'

class MyArrayTest < Minitest::Test
  def setup
    @my_array = MyArray.new([1, 2, 3, 4])
    @empty_array = MyArray.new([])
  end

  def test_cycle
    result = []
    @my_array.cycle(2) { |x| result << x }
    assert_equal [1, 2, 3, 4, 1, 2, 3, 4], result
  end

  def test_each_slice
    result = []
    @my_array.each_slice(2) { |slice| result << slice }
    assert_equal [[1, 2], [3, 4]], result
  end

  def test_inject
    result = @my_array.inject(0) { |sum, x| sum + x }
    assert_equal 10, result
  end

  def test_max_by
    result = @my_array.max_by { |x| x }
    assert_equal 4, result
  end

  def test_reject
    result = @my_array.reject { |x| x.even? }
    assert_equal [1, 3], result
  end

  def test_sort_by
    result = @my_array.sort_by { |x| -x }
    assert_equal [4, 3, 2, 1], result
  end
end