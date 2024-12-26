require 'fox16'
require "../view/student_list_view.rb"
require "../model/strategy_pattern/student_list_base.rb"
require "../model/strategy_pattern/strategy/storage_strategy_JSON.rb"
include Fox

app = FXApp.new
students_list = StudentsListBase.new('../resources/data/students.json', StorageStrategyJSON.new)
StudentListView.new(app, students_list)
app.create
app.run