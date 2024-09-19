class Students
  attr_accessor :id, :name, :birth_date, :email, :phone_number

  @@records = []

  def save
    @@records.append(self)
  end

  def destroy
    @@records.clear
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