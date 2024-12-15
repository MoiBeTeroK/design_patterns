require 'json'
require './model/strategy_pattern/strategy/strategy.rb'
require './entities/student.rb'

class StorageStrategyJSON < Strategy

  def read_from_file(file_path)
    return [] unless File.exist?(file_path)

    JSON.parse(File.read(file_path), symbolize_names: true).map do |data|
      Student.new(**data)
    end
  end

  def write_to_file(file_path, students)
    File.write(file_path, students.map(&:to_h).to_json)
  end
end