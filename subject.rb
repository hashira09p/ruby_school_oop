class Subject
  attr_accessor :id, :name

  @@records = []

  def save
    @@records.append(self)
  end

  def self.destroy_only_one(id)
    found_student = Subject.find_by_id(id)
    @@records.delete(found_student)
  end

  def display
    "ID: #{id}, Name: #{name}"
  end

  def self.all
    @@records
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end
end