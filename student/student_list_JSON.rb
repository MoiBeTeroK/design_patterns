require 'json'
require './entities/student_short.rb'
require './entities/student.rb'
require './data_list_studet_short.rb'

class StudentsListJSON
  def initialize(file_path)
    @file_path = file_path
    @students = read_from_file
  end

  def read_from_file
    return [] unless File.exist?(@file_path)

    JSON.parse(File.read(@file_path), symbolize_names: true).map do |student|
      Student.new(**student)
    end
  end

  def write_to_file
    File.write(@file_path, @students.map { |student| student.to_h }.to_json)
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  # d. Получить список k по счету n объектов класса StudentShort
  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    start_index = (k - 1) * n
    slice = @students[start_index, n] || []
    student_shorts = slice.map{ |student| StudentShort.from_student_object(student) }
    
    if existing_data_list
      existing_data_list.replace(student_shorts)
      existing_data_list
    else
      DataList.new(student_shorts)
    end
  end

  def sort_by_surname_initials!
    @students.sort_by! { |student| student.surname_initials }
  end

  def add_student(student)
    student_ids = @students.map { |student| student.id }
    max_id = student_ids.max || 0
    student.id = max_id + 1
    @students << student
  end

  def replace_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id == id }
    return IndexError, "No student id" unless index

    @students[index] = new_student
    new_student.id = id
  end

  def delete_student_by_id(id)
    @students.reject! { |student| student.id == id }
  end

  def get_student_short_count
    @students.size
  end

  private
  attr_accessor :file_path, :students
end