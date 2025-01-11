require_relative './db/movies_list_DB.rb'

db = MoviesListDB.new
db.client.exec("select * from movies;").each { |row| puts row }
puts db.get_movies_count