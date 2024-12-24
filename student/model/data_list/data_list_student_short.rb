require_relative './data_list.rb'
require_relative '../data_table/data_table.rb'

class DataListStudentShort < DataList
  def base_names
    ["Surname & initials", "Git", "Contacts"]
  end

  def data_row(item, index)
    [index + 1, item.surname_initials, item.git, item.contact,]
  end
end