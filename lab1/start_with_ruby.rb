#Задание1. Установить компилятор и текстовый редактор. Реализовать и вызвать Hello World c комментарием. (ну как всегда)
puts "hello world"

#Задание 2. Принять имя пользователя как аргумент программы. Поздороваться с пользователем с использованием форматирования строки. Спросить какой язык у пользователя любимый, в случае, если это ruby, ответить что пользователь подлиза, иначе обязательно ответить, что скоро будет ruby и поставить различные комментарии для нескольких языков.
print "Введите свое имя: "
name = gets.chomp
puts "Привет, #{name}!", "Какой ваш любимый язык программирования?"
language = gets.chomp
if language == "ruby" then
	puts "Вряд ли правда, не подлизывайтесь"
else
	print "Ничего страшного, скоро это изменится, и в твоей жизни останется только ruby. "
	if language == "python" then
		puts "Но не осуждаем."
	elsif language == "c#" then
		puts "Но ладно, у каждого свои предпочтения."
	elsif language == "php" then
		puts "Но выбор весьма сомнительный, но окэй."
	end
end

#задание 3. Продолжение предыдущего задания. Попросить пользователя ввести команду языка ruby. И команду OC. Выполнить команду руби и команду операционной системы.
puts "Введите команду языка ruby:"
command_ruby = gets.chomp
begin
  puts "Результат выполнения:"
  eval(command_ruby)
rescue SyntaxError => e
  puts "Синтаксическая ошибка: #{e.message}"
rescue => e
  puts "Ошибка выполнения: #{e.message}"
end

puts "Введите команду ОС:"
command_os = gets.chomp
system(command_os)
