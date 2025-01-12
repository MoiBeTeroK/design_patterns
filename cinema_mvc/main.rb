require_relative './db/movies_list_DB.rb'
require_relative './app/app.rb'
require 'fox16'
include Fox

app = FXApp.new('Кинотеатр')
App.new(app)
app.create
app.run