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
number = gets.chomp.to_i
puts "Сумма непросых делителей числа: #{sum_of_not_simple_num(number)}"
