require './entities/student_short.rb'
require './model/data_list/data_list_student_short.rb'

class StudentsListBase
  def initialize(file_path, strategy)
    @file_path = file_path
    @strategy = strategy
    @students = read_from_file
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    start_index = (k - 1) * n
    slice = @students[start_index, n] || []
    student_shorts = slice.map { |student| StudentShort.from_student_object(student) }
    if existing_data_list
      existing_data_list.replace(student_shorts)
      existing_data_list
    else
      DataListStudentShort.new(student_shorts)
    end
  end

  def sort_by_surname_initials!
    @students.sort_by! { |student| student.surname_initials }
  end

  def add_student(student)
    check_unique_student(student)
    student_ids = @students.map { |student| student.id }
    max_id = student_ids.max || 0
    student.id = max_id + 1
    @students << student
  end

  def replace_student(id, new_student)
    check_unique_student(new_student, id)
    index = @students.find_index { |student| student.id == id }
    raise IndexError, "No student with id #{id}" unless index

    @students[index] = new_student
    new_student.id = id
  end

  def delete_student(id)
    @students.reject! { |student| student.id == id }
  end

  def get_student_short_count
    @students.size
  end

  def write_to_file
    @strategy.write_to_file(@file_path, @students)
  end

  def read_from_file
    @strategy.read_from_file(@file_path)
  end

  private
  attr_accessor :file_path, :students, :strategy

  def check_unique_student(student, id = nil)
    duplicate = @students.find { |s| s.id != id && [s.phone, s.email, s.git].any? { |field| [student.phone, student.email, student.git].include?(field) } }
    raise "Student with the same phone, email, or git already exists!" if duplicate
  end
end