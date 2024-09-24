require_relative 'student_subject'
class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :course_id, :deleted_at

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, course_id = nil, deleted_at = nil)
   @id = id
   @name = name
   @birth_date = birth_date
   @email = email
   @phone_number = phone_number
   @course_id = course_id
   @deleted_at = deleted_at
  end

  @@records = [
    Student.new(1, "Jerome", "April 23", "jerome@gmail.com", "0917802234", "BSCS"),
    Student.new(2, "John", "April 21", "johndoe@gmail.com", "09123322234", "BSED"),
    Student.new(3, "Jane", "April 23", "jane@gmail.com", "0934567283682", "BSIT"),
    Student.new(4, "Josh", "May 13", "joshie@gmail.com", "0934567283123", "BSCPE"),
    Student.new(5, "Jas", "March 23", "jas@gmail.com", "0934567283682", "BSIT"),
    Student.new(6, "AJ", "November 13", "aj@gmail.com", "0973648589692", "BSCPE")
  ]

  def save
    @@records.append(self)
  end

  def self.destroy(id)
    found_student = Student.find_by_id(id)
    found_student.deleted_at = Time.now if found_student
  end

  def display
    "ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone: #{phone_number}, Course: #{course_id}"
  end

  def all
    @@records
  end
  def self.all
    @@records.select do |record|
      !record.deleted_at
    end
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end

  def self.students(id_input)
    subject_of_students = StudentSubject.find_by_id(id_input)
    subject_of_students
  end

end