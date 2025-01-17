require './model/entities/student_short.rb'
require './model/strategy_pattern/strategy/storage_strategy_JSON.rb'
require './model/strategy_pattern/strategy/storage_strategy_YAML.rb'
require './model/strategy_pattern/student_list_base.rb'
require './model/data_list/data_list.rb'
require './model/data_list/data_list_student_short.rb'
require './model/db/postgree.rb'
require './model/db/student_list_DB.rb'

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
#   Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"82398348901", git:"github.com/robbot22", birth_date: 20030521),
#   Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:3, phone:"82398318901", git:"github.com/robbbot22", birth_date: 20030521)
# ]

# json = StudentsListBase.new('./resources/data/students1.json', StorageStrategyJSON.new())
# students.each { |student| json.add_student(student) }
# json.write_to_file

# client = PGClient.new
# client.exec("select * from students;").each { |row| puts row }

db = StudentListDB.new
db.client.exec("select * from students;").each { |row| puts row }
puts db.get_student_short_count

pg1 = PGClient.instance
pg2 = PGClient.instance
puts pg1.object_id.equal?(pg2.object_id)