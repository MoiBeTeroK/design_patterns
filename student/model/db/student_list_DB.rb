require_relative '../entities/student.rb'
require_relative '../entities/student_short.rb'
require_relative '../data_list/data_list_student_short.rb'

class StudentListDB
  attr_accessor :client 

  def initialize
    self.client = PGClient.instance
  end

  def get_by_id(id)
    result = client.exec_params("SELECT * FROM students WHERE id = $1", [id])
    raise "Student with id=#{id} not found" if result.ntuples.zero?
    result[0] 
  end

  def get_k_n_student_short_list(k, n)
    start_index = (k - 1) * n
    result = client.exec_params(
      "SELECT id, surname, name, patronymic FROM students ORDER BY id LIMIT $1 OFFSET $2",
      [n, start_index]
    )
    if result.ntuples.zero?
      raise IndexError, 'Index out of range'
    end
    student_shorts = result.map { |row| StudentShort.from_student_object(Student.from_hash(row)) }
    DataListStudentShort.new(student_shorts)
  end
  
  def sort_by_surname_initials!
    result = client.exec("SELECT * FROM students ORDER BY surname")
    result.map { |row| row }
  end
  
  def add_student(student)
    check_unique_student(student)
    client.exec_params(
      "INSERT INTO students (surname, name, patronymic, phone, telegram, email, git, birth_date) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)",
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git, student.birth_date]
    )
  end
  
  def replace_student(id, student)
    check_unique_student(student, id)
    client.exec_params(
      "UPDATE students SET surname = $1, name = $2, patronymic = $3, phone = $4, telegram = $5, email = $6, git = $7, birth_date = $8 WHERE id = $9",
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git, student.birth_date, id]
    )
  end
  
  def delete_student(id)
    client.exec_params("DELETE FROM students WHERE id = $1", [id])
  end
  
  def get_student_short_count
    result = client.exec("SELECT COUNT(*) FROM students")
    result[0]['count'].to_i
  end

  private

  def check_unique_student(student, id = nil)
    query = "SELECT 1 FROM students WHERE (phone = $1 OR email = $2 OR git = $3)"
    params = [student.phone, student.email, student.git]
  
    if id
      query += " AND id != $4"
      params << id
    end
  
    query += " LIMIT 1"
  
    result = client.exec_params(query, params)
    if result.ntuples > 0
      raise "Student with the same phone, email or git already exists!"
    end
  end
end