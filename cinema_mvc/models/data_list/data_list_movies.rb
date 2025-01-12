require_relative './data_list.rb'

class DataListMovies < DataList
  def base_names
    ["Title", "Duration", "Age_rating", "Release_date"]
  end

  def data_row(item, index)
    [index + 1, item.title, item.duration, item.age_rating, item.release_date,]
  end
end