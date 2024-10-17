def read_from_file(file)
  begin
    File.open(file, 'r') do |f|
      f.flat_map { |line| line.split }
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
  el = array[index]
  array.all? { |x| el <= x }
end

puts is_global_minimum?(array, 6)

