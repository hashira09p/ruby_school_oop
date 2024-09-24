require_relative 'school_management'
class Teacher < SchoolManagement
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department, :deleted_at

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, department = nil, deleted_at=nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department =  department
    @deleted_at = deleted_at
  end
  @@records = [
    Teacher.new(1, "Doe", "March 23", "wew@gmail.com", "091231445", "English"),
    Teacher.new(2, "Santos","March 9", "lol@gmail.com", "091231445", "Math")
  ]

  def save
    @@records.prepend(self)
  end

  def self.destroy(id)
    found_teacher = Teacher.find_by_id(id)
    found_teacher.deleted_at = Time.now if found_teacher
  end

  def self.all
    @@records.select do |record|
      !record.deleted_at
    end
  end

  def display
    "ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone: #{phone_number}, Department: #{department} "
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end

  def self.find_by_email(email_input)
    @@records.find{|element| element.email == email_input}
  end
end