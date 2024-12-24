require 'yaml'
require_relative './strategy.rb'
require_relative '../../entities/student.rb'

class StorageStrategyYAML < Strategy

  def read_from_file(file_path)
    return [] unless File.exist?(file_path)

    YAML.load_file(file_path).map do |data|
      Student.new(**data.transform_keys(&:to_sym))
    end
  end

  def write_to_file(file_path, students)
    File.write(file_path, students.map(&:to_h).to_yaml)
  end
end