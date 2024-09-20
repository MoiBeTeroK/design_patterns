require './student_class.rb'

student1 = Student.new("Ivanov", "Ivan", "Ivanovich", 1, "80123456789", "ivan1337", "ivanov@gmail.com", "github.com/ivanov")
student2 = Student.new("Sidorov", "Dmitry", "Egorovich", 2, "81234567890", "prosto_tosto", "dmsid01@gmail.com", "github.com/robbot22")
student3 = Student.new("Petrov", "Andrey", "Dmitrievich", 3, "82345678901", "andy_panda", "andr123@gmail.com", "github.com/pojiloi_shmel")

student1.information()
student2.information()
student3.information()