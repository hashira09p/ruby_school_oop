class Course
  attr_accessor :id, :name, :deleted_at, :course_id

  def initialize(id= nil, name = nil, deleted_at = nil)
    @id = id
    @name = name
  
   end

  @@records = [
    Course.new(1,"BSCPE"),
    Course.new(2,"BSIT"),
    Course.new(3,"BSCS"),
    Course.new(4,"BSED")
  ]

  def save
    @@records.append(self)
  end

  def self.destroy(id)
    found_course = Course.find_by_id(id)
    found_course.deleted_at = Time.now if found_course
  end

  def self.all
    @@records.select do |record|
      !record.deleted_at
    end
  end

  def display
    "ID: #{id}, Course: #{name}"
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end
end

