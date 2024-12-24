require_relative './person.rb'

class Student < Person
  include Comparable
  attr_reader :phone, :telegram, :email, :surname, :name, :patronymic, :birth_date

  def initialize(id:nil, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil, birth_date: nil)
    super(id:id, git:git)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.birth_date = birth_date
    set_contacts(phone:phone, telegram:telegram, email:email)
  end

  def set_contacts(phone:nil, telegram:nil, email:nil)
    @phone = phone if Student.phone_number?(phone)
    @telegram = telegram if Student.telegram_valid?(telegram)
    @email = email if Student.email_valid?(email)
  end

  def to_s
    "ID: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic}\nТелефон: #{@phone}\nTelegram: #{@telegram}\nEmail: #{@email}\nGit: #{@git}\nДата рождения: #{@birth_date}\n" \
    "#{'-' * 40}"
  end

  def to_h
    { id: @id, surname: @surname, name: @name, patronymic: @patronymic, phone: @phone, telegram: @telegram, email: @email,  git: @git, birth_date: @birth_date}
  end

  def self.from_hash(hash)
    new(hash.transform_keys { |key| key.to_sym })
  end

  def contact
    return @phone if @phone
    return @telegram if @telegram
    return @email if @email
  end

  def <=>(other)
    birth_date <=> other.birth_date
  end

  def get_info
    "surname_initials:#{@surname} #{@name[0]}. #{@patronymic[0]}., git:#{@git || "No git"}, contact:#{contact}"
  end

  def surname=(surname)
    raise "Invalid surname" if surname.nil? || !Student.fio_valid?(surname) 
    @surname = surname if Student.fio_valid?(surname)
  end

  def name=(name)
    raise "Invalid name" if name.nil? || !Student.fio_valid?(name) 
    @name = name if Student.fio_valid?(name)
  end

  def patronymic=(patronymic)
    raise "Invalid patronymic" if patronymic.nil? || !Student.fio_valid?(patronymic) 
    @patronymic = patronymic if Student.fio_valid?(patronymic)
  end

  def git=(git)
    raise "Invalid git" if !Student.git_valid?(git) 
    @git = git if Student.git_valid?(git) 
  end

  def id=(id)
    raise "Invalid id" if !Student.id_valid?(id) 
    @id = id if Student.id_valid?(id) 
  end

  def birth_date=(birth_date)
    @birth_date = birth_date
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
  
end