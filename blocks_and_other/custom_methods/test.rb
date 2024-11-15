require "./my_array"

def test_cycle
  arr = MyArray.new([1, 2, 3, 4])
  result = []
  arr.cycle(2) { |x| result << x }
  success = result == [1, 2, 3, 4, 1, 2, 3, 4]
  success
end

def test_each_slice
  arr = MyArray.new([1, 2, 3, 4])
  result = []
  arr.each_slice(3) { |slice| result << slice.to_a }
  success = result == [[1, 2, 3], [4]]
  success
end

def test_inject
  arr = MyArray.new([1, 2, 3, 4])
  result = arr.inject(0) { |acc, num| acc + num }
  success = result == 10
  success
end

def test_max_by
  arr = MyArray.new(["apple", "banana", "strawberry", "date"])
  result = arr.max_by { |word| word.length }
  success = result == "strawberry"
  success
end

def test_reject
  arr = MyArray.new([1, 4, 8, 7, 5, 3])
  result = arr.reject { |x| x.even? }
  success = result == [1, 7, 5, 3]
  success
end

def test_sort_by
  arr = MyArray.new(["apple", "banana", "strawberry", "date"])
  result = arr.sort_by { |word| word.length }
  success = result == ["date", "apple", "banana", "strawberry"]
  success
end

def run_all_tests
  results = {
    "cycle" => test_cycle,
    "each_slice" => test_each_slice,
    "inject" => test_inject,
    "max_by" => test_max_by,
    "reject" => test_reject,
    "sort_by" => test_sort_by
  }

  success_count = results.values.count(true)
  
  puts "\nРезультаты тестов:"
  results.each do |name, result|
    puts "#{name}: #{result ? 'успешно' : 'провалился'}"
  end
  puts "\nИтог: #{success_count} из #{results.size} тестов завершились успешно."
end
run_all_tests