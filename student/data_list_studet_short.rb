require './data_list.rb'
require './data_table.rb'
require './student_short.rb'

class DataListStudentShort < DataList
  def get_names
    ["surname_initials", "contact", "git"]
  end

  def get_data
    data_for_table = @data.map.with_index do |student, index|
      [index + 1, student.surname_initials, student.contact, student.git]
    end
    DataTable.new(data_for_table)
  end
end