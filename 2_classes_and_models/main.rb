require './student_class.rb'

student1 = Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id:1, phone:"80123456789", telegram:"ivan1337", email:"ivanov@gmail.com", git:"github.com/ivanov")
student2 = Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"81234567890", telegram:"prosto_tosto", email:"dmsid01@gmail.com", git:"github.com/robbot22")
student3 = Student.new(surname:"Petrov", name:"Andrey", patronymic:"Dmitrievich", id:3, phone:"82345678901", telegram:"andy_panda", email:"andr123@gmail.com", git:"github.com/pojiloi_shmel")

student1.information()
student2.information()
student3.information()