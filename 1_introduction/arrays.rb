#Написать методы, которые находят минимальный, элементы, номер первого положительного элемента. Каждая операция в отдельном методе. Решить задачу с помощью циклов(for и while).

#Минимальный элемент в массиве
def min_el(array)
	return nil if array.size == 0
	min = array[0]
	for i in 1...array.length
		min = array[i] if min > array[i]
	end
	min
end

#Номар первого положительного элемента в массиве
def first_positive_el(array)
  return nil if array.size == 0
	for i in 0...array.length
		return i if array[i] > 0
	end
	nil
end

#Написать программу, которая принимает как аргумент два значения. Первое значение говорит, какой из методов задачи 1 выполнить, второй говорит о том, откуда читать список аргументом должен быть написан адрес файла. Далее необходимо прочитать массив и выполнить метод.

#Чтение массива из файла
def read_array(file)
  array = []
  begin
    f = File.open(file, 'r')
    while (line = f.gets)
      elements = line.split
      for el in elements
        array << el.to_i
      end
    end
    f.close
  rescue 
    puts "Такого адреса файла не существует"
    exit -1
  end
  array
end

if ARGV.size == 2
  method = ARGV[0].to_i
  array_from_file = read_array(ARGV[1])
  case method
  when 1
    puts "Минимальный элемент массива: #{min_el(array_from_file)}"
  when 2
    puts "Номер первого положительного элемента: #{first_positive_el(array_from_file)}"
  else
    puts "Необходимо ввести только 1 или 2"
  end
else puts "Необходимо ввести 2 аргумента программы"
end