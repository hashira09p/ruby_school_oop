class StudentSubject
  attr_accessor :id, :student_id, :subject_id

  def initialize(id = nil, student_id = nil, subject_id = nil)
    @id = id
    @student_id = student_id
    @subject_id = subject_id
  end

  @@records = [
    CourseSubject.new(1, "Jerome", "Software engineering"),
    CourseSubject.new(2, "John",  "Art Appreciation"),
    CourseSubject.new(3, "Jane",  "Databases"),
    CourseSubject.new(4, "Josh",  "Computer engineering Drafting and design"),
    CourseSubject.new(5, "Jas",  "Cybersecurity"),
    CourseSubject.new(6, "AJ",  "Programming Logic and Design")
  ]

  def save
    @@records.append(self)
  end

  def destroy
    @@records.delete(self)
  end

  def display
    puts "ID: #{id}"
    puts "STUDENT: #{student_id}"
    puts "SUBJECT: #{subject_id}"
  end

  def self.all
    @@records
  end

  def self.find_by_id(id_input)
    @@records.find{|element| element.id == id_input}
  end
end