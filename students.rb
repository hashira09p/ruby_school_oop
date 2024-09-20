class Students
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  @@records = []

  def initialize
    @deleted_at = deleted_at = nil
  end
  def save
    @@records.append(self)
  end

  def destroy_all
    @@records.clear
  end

  def self.destroy_only_one(id)
    found_student = Students.find_by_id(id)
    Students.delete_at = Time.now if found_student
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