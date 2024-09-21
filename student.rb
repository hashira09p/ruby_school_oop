class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, deleted_at = nil)
   @id = id
   @name = name
   @birth_date = birth_date
   @email = email
   @phone_number = phone_number
   @deleted_at = deleted_at
  end

  @@records = [
    Student.new(1, "Jerome", "April 23", "jerome@gmail.com", "0917802234"),
    Student.new(2, "John", "April 21", "johndoe@gmail.com", "09123322234"),
  ]

  def save
    @@records.append(self)
  end

  def self.destroy(id)
    found_student = Student.find_by_id(id)
    found_student.deleted_at = Time.now if found_student
  end

  def display
    "ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone: #{phone_number} "
  end

  def self.all
    @@records.select do |record|
      !record.deleted_at
    end
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end
end