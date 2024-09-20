class Student
  def initialize(surname, name, patronymic, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

   # Геттеры
   def id
    @id
  end

  def surname
    @surname
  end

  def name
    @name
  end

  def patronymic
    @patronymic
  end

  def phone
    @phone
  end

  def telegram
    @telegram
  end

  def email
    @email
  end

  def git
    @git
  end

  # Сеттеры
  def set_id=(id)
    @id = id
  end

  def set_surname=(surname)
    @surname = surname
  end

  def set_name=(name)
    @name = name
  end

  def set_patronymic=(patronymic)
    @patronymic = patronymic
  end

  def set_phone=(phone)
    @phone = phone
  end

  def set_telegram=(telegram)
    @telegram = telegram
  end

  def set_email=(email)
    @email = email
  end

  def set_git=(git)
    @git = git
  end

  def information()
    puts "id: #{@id}", "surname: #{@surname}", "name: #{@name}", "patronymic: #{@patronymic}", "phone: #{@phone}", "telegram: #{@telegram}", "email: #{@email}", "git: #{@git}", "#{'-' * 40}"
  end
end