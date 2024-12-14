require 'yaml'
require './student_list_base.rb'
require './entities/student.rb'

class StudentsListYAML < StudentsListBase

  def read_from_file
    return [] unless File.exist?(@file_path)

    YAML.load_file(@file_path).map do |data|
      Student.new(**data.transform_keys(&:to_sym))
    end
  end

  def write_to_file
    File.write(@file_path, @students.map(&:to_h).to_yaml)
  end
end