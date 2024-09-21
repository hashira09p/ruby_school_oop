class Subject
  attr_accessor :id, :name, :deleted_at

  def initialize(id = nil, name = nil, deleted_at = nil)
    @id = id
    @name = name
    @deleted_at = deleted_at
   end
   
  @@records = [
    Subject.new(1, "Math"),
    Subject.new(2, "English")
  ]

  def save
    @@records.append(self)
  end

  def self.destroy(id)
    found_subject = Subject.find_by_id(id)
    found_subject.deleted_at = Time.now if found_subject
  end

  def self.all
    @@records.select do |record|
      !record.deleted_at
    end
  end

  def display
    "ID: #{id}, Name: #{name}"
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end
end