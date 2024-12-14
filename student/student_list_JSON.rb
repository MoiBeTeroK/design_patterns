require 'json'
require './student_list_base.rb'
require './entities/student.rb'

class StudentsListJSON < StudentsListBase

  def read_from_file
    return [] unless File.exist?(@file_path)

    JSON.parse(File.read(@file_path), symbolize_names: true).map do |data|
      Student.new(**data)
    end
  end

  def write_to_file
    File.write(@file_path, @students.map(&:to_h).to_json)
  end
end