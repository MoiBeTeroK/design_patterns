require './data_list/data_list.rb'
require './data_table/data_table.rb'

class DataListStudentShort < DataList
  def initialize(data)
    super(data)
  end

  def get_names
    ["№", "surname_initials", "contact", "git"]
  end

  def data_row(index)
    [index + 1, @data[index].surname_initials, @data[index].contact, @data[index].git]
  end
end