require_relative './db/movies_list_DB.rb'
require_relative './app/app.rb'
require 'fox16'
include Fox

# db = MoviesListDB.new
# db.client.exec("select * from movies;").each { |row| puts row }
# puts db.get_movies_count

app = FXApp.new('Кинотеатр', 'Кинотеатр')
App.new(app)
app.create
app.run