require_relative '../models/data_list/data_list_movies.rb'
require_relative '../db/movies_list_DB.rb'

class MoviesListController

  def initialize(view)
    @view = view
    @model = MoviesListDB.new
    @data_list = DataListMovies.new([])
    @data_list.add_observer(@view)
  end

  def refresh_data
    @model.get_movies(@view.current_page, @view.items_per_page-1,  @data_list)
    @data_list.count = @model.get_movies_count
    @data_list.notify
  end

  def create
    # добавление
  end

  def edit(index)
    #  изменение
  end

  def delete(index)
    #  удаление
  end

end