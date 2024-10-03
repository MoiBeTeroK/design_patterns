require './student_class.rb'

student1 = Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id:1, phone:"80123456789", telegram:"@ivan1337", email:"ivanov@gmail.com", git:"github.com/ivanov")
student2 = Student.new(surname:"Sidorov", name:"Dmitry", patronymic:"Egorovich", id:2, phone:"82398348901", git:"github.com/robbot22")
student3 = Student.new(surname:"Petrov", name:"Andrey", patronymic:"Dmitrievich", id:3, phone:"82345678901", telegram:"@andy_panda", email:"andr123@gmail.com")


# puts student2.to_s
# student2.set_contacts({email:"sid22@gmail.com", phone:"89181111111"})
# puts student2.to_s

# puts student3.get_info


data = "surname_initial=Ivarov I.R., git=https://github.com/ivanov, contact=телефон: +79161234567"
student_short = StudentShort.from_string(1, data)