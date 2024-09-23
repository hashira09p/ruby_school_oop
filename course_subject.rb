class CourseSubject
  attr_accessor :id, :course_id, :subject_id

  def initialize(id = nil, course_id = nil, subject_id = nil)
    @id = id
    @course_id = course_id
    @subject_id = subject_id
  end

  @@records = [
    CourseSubject.new(1 , "BSIT", "Software engineering"),
    CourseSubject.new(2, "BSCPE", "Programming Logic and Design"),
    CourseSubject.new(3, "BSED", "Assessment of student learning")
  ]

  def save
    @@records.append(self)
  end
  
  def destroy
    @@records.delete(self)
  end

  def display
    puts "ID: #{id}"
    puts "COURSE ID: #{course_id}"
    puts "SUBJECT: #{subject_id}"
  end

  def self.all
    @@records
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end
end