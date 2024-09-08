#Вариант 6.
#Метод 1. Найти сумму непростых делителей числа.
def find_divisors(number)
	return [] if number == 0
	divs = []
	for i in 1..number
		divs << i if number % i == 0
	end
	divs
end

def sum_of_not_simple_num(number)
	return 0 if number <=1
	sum = 0
	divs = find_divisors(number)
	for div in divs
		num = find_divisors(div)
  	sum += div if num.length > 2
  end
  sum
end

puts "Введите число:"
number = gets.to_i
puts "Сумма непросых делителей числа: #{sum_of_not_simple_num(number)}"

#Метод 2. Найти количество цифр числа, меньших 3.
def count_number_less_three(number)
	count = 0
	number = number.abs
	while number > 0
		digit = number % 10
		count +=1 if digit < 3
		number /= 10
	end
	count
end

puts "Введите число:"
digit = gets.to_i
puts "Количество цифр числа, меньших 3: #{count_number(digit)}"
