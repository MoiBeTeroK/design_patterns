class Person

  def initialize(id:, git:nil)
    @id = id
    @git = git
    raise ArgumentError, "Invalid git" if !self.class.git_valid?(@git)
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

end

class Student < Person
  attr_accessor :surname, :name, :patronymic, :id, :git
  attr_reader :phone, :telegram, :email

  def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
    super(id:id, git:git)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    set_contacts(phone:phone, telegram:telegram, email:email)
    
    raise ArgumentError, "Surname cannot be empty" if !self.class.fio_valid?(@surname)
    raise ArgumentError, "Name cannot be empty" if !self.class.fio_valid?(@name)
    raise ArgumentError, "Patronymic cannot be empty" if !self.class.fio_valid?(@patronymic)
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

  def get_contact
    return @phone if @phone
    return @telegram if @telegram
    return @email if @email
  end

  def get_info
    "surname_initials:#{@surname} #{@name[0]}. #{@patronymic[0]}., git:#{@git || "No git"}, contact:#{get_contact}"
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
    raise ArgumentError,"Incorrect phone number" if !self.class.phone_number?(phone)
    @phone = phone
  end

  def telegram=(telegram)
    raise ArgumentError,"Incorrect telegram" if !self.class.telegram_valid?(telegram)
    @telegram = telegram
  end

  def email=(email)
    raise ArgumentError,"Incorrect email" if !self.class.email_valid?(email)
    @email = email
  end

  def surname=(surname)
    @surname = surname if self.class.fio_valid?(surname)
  end

  def name=(name)
    @name = name if self.class.fio_valid?(name)
  end

  def patronymic=(patronymic)
    @patronymic = patronymic if self.class.fio_valid?(patronymic)
  end
end

class StudentShort < Person
  attr_reader :id, :surname_initials, :contact, :git

  def initialize(id:, surname_initials:, git:nil, contact:nil)
    super(id:id,git: git)
    @surname_initials = surname_initials
    @contact = contact
  end

  def self.from_string(id, info)
    surname_initials = ""
    git = ""
    contact = ""

    info.split(",").each do |field|
      pair = field.split(":")

      if pair.length != 2
        raise ArgumentError, "Invalid info"
      end

      if pair[0].strip == "surname_initials"
        surname_initials= pair[1].strip
      elsif pair[0].strip == "git"
        git= pair[1].strip
      elsif pair[0].strip == "contact"
        contact= pair[1].strip
      else
        raise ArgumentError, "Invalid field"
      end
    end
    StudentShort.new(id:id, surname_initials:surname_initials, git:git, contact:contact)
  end
end