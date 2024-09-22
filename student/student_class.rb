class Student

  attr_accessor :surname, :name, :patronymic, :id, :telegram, :email, :git
  attr_reader :phone, :telegram, :email, :git

  def initialize(parameters)
    @surname = parameters[:surname]
    @name = parameters[:name]
    @patronymic = parameters[:patronymic]
    @id = parameters[:id]
    self.phone = parameters[:phone]
    self.telegram = parameters[:telegram]
    self.email = parameters[:email]
    self.git = parameters[:git]

    raise "Surname, name and patronymic cannot be empty" if @surname.nil? || @name.nil? || @patronymic.nil?
  end

  def self.phone_number?(phone)
    phone.match(/\A(\+?7|8)\d{10}\z/)
  end

  def self.email_valid?(email)
    email.match?(/\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/)
  end

  def self.telegram_valid?(telegram)
    telegram.match?(/\A@[a-zA-Z0-9_]{5,}\z/)
  end

  def self.git_valid?(git)
    git.match?(/\A(https:\/\/)?github.com\/[a-zA-Z0-9_-]+\z/)
  end

  def phone=(phone)
    raise "Incorrect phone number" if !Student.phone_number?(phone)
    @phone = phone
  end

  def telegram=(telegram)
    raise "Incorrect telegram" if !Student.telegram_valid?(telegram)
    @telegram=telegram
  end

  def email=(email)
    raise "Incorrect email"if !Student.email_valid?(email)
    @email=email
  end

  def git=(git)
    raise "Incorrect git"if !Student.git_valid?(git)
    @git=git
  end

  def information()
    puts "id: #{@id}", "surname: #{@surname}", "name: #{@name}", "patronymic: #{@patronymic}", "phone: #{@phone}", "telegram: #{@telegram}", "email: #{@email}", "git: #{@git}", "#{'-' * 40}"
  end
end