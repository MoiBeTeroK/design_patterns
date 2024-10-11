class Person

  def initialize(id:nil, git:nil)
    @id = id
    @git = git
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
    !fio.nil? && fio.match?(/^[A-Z][a-z]*\z/)
  end

  def validate?
    raise ArgumentError, "No git and contacts"
  end
  
  def contact
    raise ArgumentError, "No contacts"
  end
end

class Student < Person
  attr_accessor :surname, :name, :patronymic, :id, :git
  attr_reader :phone, :telegram, :email

  def initialize(id:nil, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
    raise ArgumentError, "Surname cannot be empty" if !Student.fio_valid?(surname)
    raise ArgumentError, "Name cannot be empty" if !Student.fio_valid?(name)
    raise ArgumentError, "Patronymic cannot be empty" if !Student.fio_valid?(patronymic)
    
    super(id:id, git:git)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    set_contacts(phone:phone, telegram:telegram, email:email)
  end

  def set_contacts(phone:nil, telegram:nil, email:nil)
    self.phone = phone if Student.phone_number?(phone)
    self.telegram = telegram if Student.telegram_valid?(telegram)
    self.email = email if Student.email_valid?(email)
  end

  def to_s
    "ID: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic}\nТелефон: #{@phone}\nTelegram: #{@telegram}\nEmail: #{@email}\nGit: #{@git}\n" \
    "#{'-' * 40}"
  end

  def contact
    return @phone if @phone
    return @telegram if @telegram
    return @email if @email
  end

  def get_info
    "surname_initials:#{@surname} #{@name[0]}. #{@patronymic[0]}., git:#{@git || "No git"}, contact:#{contact}"
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

  private 

  def phone=(phone)
    raise ArgumentError,"Incorrect phone number" if !Student.phone_number?(phone)
    @phone = phone
  end

  def telegram=(telegram)
    raise ArgumentError,"Incorrect telegram" if !Student.telegram_valid?(telegram)
    @telegram = telegram
  end

  def email=(email)
    raise ArgumentError,"Incorrect email" if !Student.email_valid?(email)
    @email = email
  end

  def surname=(surname)
    @surname = surname if Student.fio_valid?(surname)
  end

  def name=(name)
    @name = name if Student.fio_valid?(name)
  end

  def patronymic=(patronymic)
    @patronymic = patronymic if Student.fio_valid?(patronymic)
  end
end

class StudentShort < Person
  attr_reader :id, :git, :surname_initials, :contact

  def initialize(student, contact: nil)
    raise "The :surname_initials is missing" unless student.surname || student.name ||student.patronymic

    super(id: student.id, git: student.git)
    @surname_initials = "#{student.surname} #{student.name[0]}. #{student.patronymic[0]}."
    @contact = student.phone || student.telegram || student.email
  end

  def self.from_string(id, info)
    surname_initials = ""
    git = ""
    contact = ""

    info.split(",").each do |field|
      pair = field.split(":")
      raise ArgumentError, "Invalid info" if pair.length != 2

      case pair[0].strip
      when "surname_initials"
        surname_initials = pair[1].strip
      when "git"
        git = pair[1].strip
      when "contact"
        contact = pair[1].strip
      else
        raise ArgumentError, "Invalid field"
      end
    end
    surname, name, patronymic = surname_initials.gsub('.', '').split(" ", 3)
    student = Student.new(id:id, surname: surname, name: name, patronymic: patronymic, git: git)
    student_sh = StudentShort.new(student, contact: contact)
  end

  def validate?
    StudentShort.git_valid?(@git) && !@contact.nil?
  end
end