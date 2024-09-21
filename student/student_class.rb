class Student

  attr_accessor :surname, :name, :patronymic, :id, :phone, :telegram, :email, :git

  def initialize(parameters)
    @surname = parameters[:surname]
    @name = parameters[:name]
    @patronymic = parameters[:patronymic]
    @id = parameters[:id]
    @phone = parameters[:phone]
    @telegram = parameters[:telegram]
    @email = parameters[:email]
    @git = parameters[:git]

    raise "Surname, name and patronymic cannot be empty" if @surname.nil? || @name.nil? || @patronymic.nil?
  end

  def information()
    puts "id: #{@id}", "surname: #{@surname}", "name: #{@name}", "patronymic: #{@patronymic}", "phone: #{@phone}", "telegram: #{@telegram}", "email: #{@email}", "git: #{@git}", "#{'-' * 40}"
  end
end