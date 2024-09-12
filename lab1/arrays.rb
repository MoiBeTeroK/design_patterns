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