require_relative './data_list.rb'
require_relative '../data_table/data_table.rb'

class DataListMovies < DataList
  def base_names
    ["Title", "Duration", "Age_rating", "Release_date"]
  end

  def data_row(item, index)
    [index + 1, item.surname_initials, item.git, item.contact,]
  end
end