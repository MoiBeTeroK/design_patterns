require './student_class.rb'

student1 = Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id:1, phone:"80123456789", telegram:"@ivan1337", email:"ivanov@gmail.com", git:"github.com/ivanov")
student2 = Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"82398348901", git:"github.com/robbot22")
student3 = Student.new(surname:"Petrov", name:"Andrey", patronymic:"Dmitrievich", id:3, phone:"82345678901", telegram:"@andy_panda", email:"andr123@gmail.com")

puts student2.to_s


student_short1 = StudentShort.new(id: 1, surname_initials: "Ivanov I.I.", git: "https://github.com/ivanov_short", contact: "+79991234567")

info_string = "surname_initials:Ivanov I.I., git:github.com/ivanov_short, contact:89991234567"
student_short2 = StudentShort.from_string(2, info_string)

info_student2=student2.get_info
student_short3 = StudentShort.from_string(3, info_student2)