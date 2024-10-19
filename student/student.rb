require './person.rb'

class Student < Person
  attr_reader :phone, :telegram, :email, :surname, :name, :patronymic

  def initialize(id:nil, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
    super(id:id, git:git)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    set_contacts(phone:phone, telegram:telegram, email:email)
  end

  def set_contacts(phone:nil, telegram:nil, email:nil)
    @phone = phone if Student.phone_number?(phone)
    @telegram = telegram if Student.telegram_valid?(telegram)
    @email = email if Student.email_valid?(email)
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
end