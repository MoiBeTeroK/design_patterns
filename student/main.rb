require './student.rb'
require './student_short.rb'
require './student_tree.rb'

student1 = Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id:1, phone:"80123456789", telegram:"@ivan1337", email:"ivanov@gmail.com", git:"github.com/ivanov", birth_date: "2007-01-15")
student2 = Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"82398348901", git:"github.com/robbot22", birth_date: "2003-05-21")
student3 = Student.new(surname:"Petrov", name:"Andrey", patronymic:"Dmitrievich", id:3, phone:"82345678901", telegram:"@andy_panda", email:"andr123@gmail.com")

# student_short1 = StudentShort.new(id:5, surname_initials:"Romanov I. R.", contact:"89184345678", git:"github.com/romanov111")

# info_student2=student2.get_info
# student_short_get_info=StudentShort.from_string(3, info_student2)

# data = "surname_initials:Ivanov I. I., git:github.com/ivanov123, contact:89876543210"
# student_short3 = StudentShort.from_string(1, data)

# student_short4 = StudentShort.from_student_object(student2)

tree = StudentTree.new
tree.add(student1)
tree.add(student2)
tree.add(student3)

tree.each { |student| puts student.to_s }