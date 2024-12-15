require './entities/student_short.rb'
require './strategy/storage_strategy_JSON.rb'
require './strategy/storage_strategy_YAML.rb'
require './student_list_base.rb'
require './data_list/data_list.rb'
require './data_list/data_list_student_short.rb'
require './db/postgree.rb'
require './db/student_list_DB.rb'

# test = DataListStudentShort.new([
#   StudentShort.new(id:1, surname_initials:"Ivanov I. I.", contact:"ivanov227@gmail.com",  git:"github.com/ivanov"),
#   StudentShort.new(id:2, surname_initials:"Petrov P. P.", contact:"@test_tgk",  git:"github.com/wsed4"),
#   StudentShort.new(id:3, surname_initials:"Sidorov S. S.", contact:"89320509129",  git:"github.com/dhy49")
# ])

# puts test.get_data().get_element(0, 2) 
# test.select(1)
# test.select(2)
# test.get_selected.each { |item| puts item.to_s }

# students = [
#   Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id:1, phone:"80123456789", telegram:"@ivan1337", email:"ivanov@gmail.com", git:"github.com/ivanov", birth_date: 20070115),
#   Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"82398348901", git:"github.com/robbot22", birth_date: 20030521)
# ]

# json = StudentsListBase.new('./students.json', StorageStrategyJSON.new())
# students.each { |student| json.add_student(student) }
# json.write_to_file

# client = PG_client.new
# client.exec("select * from students;").each { |row| puts row }

db = StudentListDB.new
db.client.exec("select * from students;").each { |row| puts row }
puts db.get_student_short_count