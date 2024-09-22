class Student

  attr_accessor :surname, :name, :patronymic, :id, :telegram, :email, :git
  attr_reader :phone

  def initialize(parameters)
    @surname = parameters[:surname]
    @name = parameters[:name]
    @patronymic = parameters[:patronymic]
    @id = parameters[:id]
    self.phone = parameters[:phone]
    @telegram = parameters[:telegram]
    @email = parameters[:email]
    @git = parameters[:git]

    raise "Surname, name and patronymic cannot be empty" if @surname.nil? || @name.nil? || @patronymic.nil?
  end

  def self.phone_number?(phone)
    phone.match(/\A(\+?7|8)\d{10}\z/)
  end

  def phone=(phone)
    raise "Incorrect phone number" if !Student.phone_number?(phone)
    @phone = phone
  end

  def information()
    puts "id: #{@id}", "surname: #{@surname}", "name: #{@name}", "patronymic: #{@patronymic}", "phone: #{@phone}", "telegram: #{@telegram}", "email: #{@email}", "git: #{@git}", "#{'-' * 40}"
  end
end