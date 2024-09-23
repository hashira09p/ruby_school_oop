class CourseSubject
  attr_accessor :id, :course_id, :subject_id

  def initialize(id = nil, course_id = nil, subject_id = nil)
    @id = id
    @course_id = course_id
    @subject_id = subject_id
  end

  @@records = [
    CourseSubject.new(1 , "BSCS", "Software engineering"),
    CourseSubject.new(2, "BSCPE", "Programming Logic and Design"),
    CourseSubject.new(3, "BSED", "Assessment of student learning"),
    CourseSubject.new(4, "BSED", "Art Appreciation"),
    CourseSubject.new(5, "BSCPE", "Computer engineering Drafting and design"),
    CourseSubject.new(6, "BSIT", "Databases"),
    CourseSubject.new(7, "BSIT", "Cybersecurity")
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

  def self.find_by_course_name(name_input)
    @@records.select{|element| element.course_id == name_input}
  end
end