require './entities/person.rb'

class StudentShort < Person
  attr_reader :surname_initials, :contact

  def initialize(id:nil, surname_initials:, contact:nil, git: nil)
    super(id: id, git: git)
    @surname_initials=surname_initials
    @contact=contact
  end
  
  def self.from_student_object(student)
    new(id: student.id, git: student.git, surname_initials: "#{student.surname} #{student.name[0]}. #{student.patronymic[0]}.", contact: student.phone || student.telegram || student.email)
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
    new(id:id, surname_initials:surname_initials, contact:contact, git: git)
  end

  def to_s
    "ID: #{@id}\nФИО: #{@surname_initials}\nКонтакт: #{@contact}\nGit: #{@git}\n#{'-' * 40}"
  end
end