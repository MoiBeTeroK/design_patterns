# Вариант 5

def read_from_file(file)
  begin
    File.open(file, 'r') do |f|
      f.flat_map { |line| line.split.map{|x| x.to_i } }
    end
  rescue
    puts "Такого адреса файла не существует"
    exit -1
  end
end

def read_from_input 
  puts "Введите элементы массива:"
  input = gets.chomp 
  input.split.map(&:to_i)
end

# Меню для выбора задачи
puts "Выберите задачу для решения:"
puts "1 - Дан целочисленный массив и натуральный индекс (число, меньшее размера массива). Необходимо определить является ли элемент по указанному индексу глобальным минимумом."
puts "2 - Дан целочисленный массив. Необходимо поменять местами минимальный и максимальный элементы массива??????????????????????"
puts "3 - Дан целочисленный массив и интервал a..b. Необходимо проверить наличие максимального элемента массива в этом интервале"
puts "4 - Дан целочисленный массив. Найти среднее арифметическое модулей его элементов"
puts "5 - Для введенного списка построить новый с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение"

task_choice = gets.chomp.to_i

puts "Способ ввода: 1 - с клавиатуры, 2 - из файла"
choice = gets.chomp.to_i

if choice == 1 
  array = read_from_input
elsif choice == 2 
  puts "Введите путь к файлу:"
  file = gets.chomp
  array = read_from_file(file)
else puts "Неверный выбор"
  exit
end

# 5 Дан целочисленный массив и натуральный индекс (число, меньшее размера массива). Необходимо определить является ли элемент по указанному индексу глобальным минимумом.

def is_global_minimum?(array, index)
  return false if array.empty?
  el = array[index]
  array.all? { |x| el <= x }
end

# 17 Дан целочисленный массив. Необходимо поменять местами минимальный и максимальный элементы массива.

def swap_min_max(arr)
  return [] if arr.empty?
  min_index = arr.index(arr.min)
  max_index = arr.index(arr.max)
  arr[min_index], arr[max_index] = arr[max_index], arr[min_index]
  arr
end

# 29 Дан целочисленный массив и интервал a..b. Необходимо проверить наличие максимального элемента массива в этом интервале.

def max_in_range?(array, a, b)
  return false if array.empty?
  max_el = array.max
  in_range = a <= max_el && max_el <= b
end

# 41 Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.

def average_absolute(array)
  return 0 if array.empty?
  sum_abs = array.map { |x| x.abs }.sum
  count = array.size
  average = sum_abs.to_f / count
end

# 53 Для введенного списка построить новый с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение.

def modified_list(array)
  return [] if array.empty?
  average = array.sum.to_f / array.size
  max_value = array.max
  new_array = array.select { |x| x > average && x < max_value }
end

case task_choice
when 1
  puts is_global_minimum?(array, 6)
when 2 
  puts "Исходный массив: #{array}"
  new_array = swap_min_max(array)
  puts "Преобразованный массив: #{new_array}"
when 3 
  puts max_in_range?(array, 1, 100)
when 4 
  puts average_absolute(array)
when 5 
  print modified_list(array)
else puts "Неверный выбор задачи"
end