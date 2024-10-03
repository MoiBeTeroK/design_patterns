class Student

  attr_accessor :surname, :name, :patronymic, :id, :git
  attr_reader :phone, :telegram, :email

  def initialize(parameters)
    self.surname = parameters[:surname]
    self.name = parameters[:name]
    self.patronymic = parameters[:patronymic]
    @id = parameters[:id]
    self.git = parameters[:git]
    set_contacts(parameters)
    
    raise "Surname cannot be empty" if !self.class.fio_valid?(@surname)
    raise "Name cannot be empty" if !self.class.fio_valid?(@name)
    raise "Patronymic cannot be empty" if !self.class.fio_valid?(@patronymic)
  end

  def self.phone_number?(phone)
    phone.nil? || phone.match?(/\A(\+?7|8)\d{10}\z/)
  end

  def self.email_valid?(email)
    email.nil? || email.match?(/\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/)
  end

  def self.telegram_valid?(telegram)
    telegram.nil? || telegram.match?(/\A@[a-zA-Z0-9_]{5,}\z/)
  end

  def self.git_valid?(git)
    git.nil? || git.match?(/\A(https:\/\/)?github.com\/[a-zA-Z0-9_-]+\z/)
  end

  def self.fio_valid?(fio)
    !fio.nil? && fio.match?(/^[A-Z][a-z]+\z/)
  end

  private 

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

  def surname=(surname)
    @surname=surname if Student.fio_valid?(surname)
  end

  def name=(name)
    @name=name if Student.fio_valid?(name)
  end

  def patronymic=(patronymic)
    @patronymic=patronymic if Student.fio_valid?(patronymic)
  end

  public
  
  def git=(git)
    raise "Incorrect git"if !Student.git_valid?(git)
    @git=git
  end

  def has_git?
    !@git.nil? && Student.git_valid?(@git)
  end

  def has_contact?
    (!@phone.nil? && Student.phone_number?(@phone)) ||
    (!@telegram.nil? && Student.telegram_valid?(@telegram)) ||
    (!@email.nil? && Student.email_valid?(@email))
  end

  def validate?
    has_git? && has_contact?
  end

  def set_contacts(contacts)
    self.phone = contacts[:phone] if contacts[:phone]
    self.telegram = contacts[:telegram] if contacts[:telegram]
    self.email = contacts[:email] if contacts[:email]
  end

  def to_s
    "ID: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic}\nТелефон: #{@phone}\nTelegram: #{@telegram}\nEmail: #{@email}\nGit: #{@git}\n" \
    "#{'-' * 40}"
  end
  
  def get_contact
    return "телефон: #{@phone}" if @phone
    return "телеграм: #{@telegram}" if @telegram
    return "почта: #{@email}" if @email
  end
   
  def git_link
    @git || "No git"
  end

  def get_info
    "ФИО: #{@surname} #{@name[0]}. #{@patronymic[0]}.; Git: #{git_link}; Контакты - #{get_contact}"
  end
end


class StudentShort
  attr_reader :id, :surname_initials, :git, :contact

  def initialize(student)
    raise "The :id is missing" unless student.id
    raise "The :surname_initials is missing" unless student.surname_initials
    raise "The :git is missing" unless student.git
    raise "The :contact is missing" unless student.has_contact?

    @id = student.id
    @surname_initials = student.surname_initials
    @git = student.git
    @contact = student.get_contact
  end

  def self.from_string(id, info)
    student_info = { id: id }
    info.split(",").each do |field|
      pair = field.split("=")

      if pair.length != 2
        raise ArgumentError, "Invalid info"
      end
      case pair[0].strip
      when "surname_initial"
        student_info[:surname_initial] = pair[1].strip
      when "git"
        student_info[:git] = pair[1].strip
      when "contact"
        student_info[:contact] = pair[1].strip
      else
        raise ArgumentError, "Invalid field"
      end
    end
  end
end