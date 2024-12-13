# require './entities/student.rb'
require './entities/student_short.rb'
# require './entities/student_tree.rb'

require './data_list.rb'
require './data_list_studet_short.rb'

# student1 = Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id:1, phone:"80123456789", telegram:"@ivan1337", email:"ivanov@gmail.com", git:"github.com/ivanov", birth_date: 20070115)
# student2 = Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"82398348901", git:"github.com/robbot22", birth_date: 20030521)
# student3 = Student.new(surname:"Petrov", name:"Andrey", patronymic:"Dmitrievich", id:3, phone:"82345678901", telegram:"@andy_panda", email:"andr123@gmail.com")

# student_short1 = StudentShort.new(id:5, surname_initials:"Romanov I. R.", contact:"89184345678", git:"github.com/romanov111")

# info_student2=student2.get_info
# student_short_get_info=StudentShort.from_string(3, info_student2)

# data = "surname_initials:Ivanov I. I., git:github.com/ivanov123, contact:89876543210"
# student_short3 = StudentShort.from_string(1, data)

# student_short4 = StudentShort.from_student_object(student2)

# tree = StudentTree.new(student1)
# tree.add(student2)
# tree.add(student3)
# tree.add(student4)

# tree.each { |student| puts student.to_s }


test = DataListStudentShort.new([
  StudentShort.new(id:1, surname_initials:"Ivanov I. I.", contact:"ivanov227@gmail.com",  git:"github.com/ivanov"),
  StudentShort.new(id:2, surname_initials:"Petrov P. P.", contact:"@test_tgk",  git:"github.com/wsed4"),
  StudentShort.new(id:3, surname_initials:"Sidorov S. S.", contact:"89320509129",  git:"github.com/dhy49")
])

puts test.get_data().get_element(0, 2) 
test.select(1)
test.select(2)
test.get_selected.each { |item| puts item.to_s }