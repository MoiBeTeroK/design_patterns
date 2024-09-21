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

#Метод 3. Найти количество чисел, не являющихся делителями исходного числа, не взамнопростых с ним и взаимно простых с суммой простых цифр этого числа.
def divisors_or_not(number, find_divisors = true)
    return [] if number == 0
    divs = []
    for i in 1..number
        if find_divisors
            divs << i if number % i == 0
        else
            divs << i if number % i != 0
        end
    end
    divs
end

def sum_of_simple_digits(number)
	count = 0
	number = number.abs
	while number > 0
		digit = number % 10
		divs_num = divisors_or_not(digit)
		count += digit if divs_num.length == 2
		number /= 10
	end
	count
end

def coprime_numbers(num1, num2)
	divs1 = divisors_or_not(num1)
	divs2 = divisors_or_not(num2)
	divs = divs1 & divs2
	return divs == [1]
end

def count_non_divs_not_coprime_with_number_and_coprime_with_digit_sum(number)
	not_div = divisors_or_not(number, false)
	count = 0
	sum_digits = sum_of_simple_digits(number)
	for num in not_div
		count += 1 if coprime_numbers(number, num) == false and coprime_numbers(num, sum_digits)
	end
	count
end

puts "Введите число:"
number = gets.to_i
puts "Количество чисел, удовлетворяющих условию: #{count_non_divs_not_coprime_with_number_and_coprime_with_digit_sum(number)}"
