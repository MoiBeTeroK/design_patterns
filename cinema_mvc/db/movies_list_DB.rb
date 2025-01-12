require_relative '../models/entities/movies.rb'
require_relative './postgree.rb'

class MoviesListDB
  attr_accessor :client 

  def initialize
    self.client = PGClient.instance
  end

  def get_by_id(id)
    result = client.exec_params("SELECT * FROM students WHERE id = $1", [id])
    raise "Student with id=#{id} not found" if result.ntuples.zero?
    Movies.from_hash(result[0])
  end

  def get_movies(k, n, data_list = nil)
    start_index = (k - 1) * n
    query = "SELECT * FROM movies LIMIT #{n} OFFSET #{start_index}"
    result = client.exec(query)
    if result.ntuples.zero?
      raise IndexError, 'Index out of range'
    end
    movies = result.map { |row| Movies.from_hash(row) }
    data_list ||= DataListMovies.new(movies)
    data_list.data = movies
    data_list
  end
  
  def add_movie(movie)
    check_unique_movie(movie)
    client.exec_params(
      "INSERT INTO movies (title, duration, age_rating, release_date) VALUES ($1, $2, $3, $4)",
      [movie.title, movie.duration, movie.age_rating, movie.release_date]
    )
  end
  
  def replace_movie(id, movie)
    check_unique_movie(movie, id)
    client.exec_params(
      "UPDATE movies SET title = $1, duration = $2, age_rating = $3, release_date = $4",
      [movie.title, movie.duration, movie.age_rating, movie.release_date]
    )
  end
  
  def delete_movie(id)
    client.exec_params("DELETE FROM movies WHERE id = $1", [id])
  end
  
  def get_movies_count
    result = client.exec("SELECT COUNT(*) FROM movies")
    result[0]['count'].to_i
  end

  private

  def check_unique_movie(movie, id = nil)
    query = "SELECT 1 FROM movies WHERE title = $1 AND release_date = $2"
    params = [movie.title, movie.release_date]

    if id
      query += " AND id != $3"
      params << id
    end

    query += " LIMIT 1"

    result = client.exec_params(query, params)
    raise "Movie with the same title and release date already exists!" if result.ntuples > 0
  end
end