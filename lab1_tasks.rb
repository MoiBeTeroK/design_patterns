puts "hello world"

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
