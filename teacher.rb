class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department, :delete_at

  def save
    @@records.append(self)
  end

  def destroy_all
    @@records.clear
  end

  def self.destroy_only_one(id)
    found_student = Teacher.find_by_id(id)
    @@records.delete(found_student)
  end

  def display
    "ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone: #{phone_number} "
  end

  def self.all
    @@records
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end

  def self.find_by_email(email_input)
    @@records.find{|element| element.email == email_input}
  end
end