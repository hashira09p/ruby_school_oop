require_relative 'students'
require_relative 'course'
require_relative 'subject'

student_id = 1
course_id = 1
subject_id = 1

#STUDENT MANAGEMENT
def add(id_number)
  new_student = Students.new
  new_student.id = id_number
  puts "Please input a name"
  new_student.name = gets.chomp
  puts "Please input birthday"
  new_student.birth_date = gets.chomp
  puts "Please input email"
  new_student.email = gets.chomp
  puts "Please input phone number"
  new_student.phone_number = gets.chomp.to_i
  new_student.save

  puts "Student added successfully!"
  Students.all.each do |element|
    puts element.display
  end
end

def delete
  puts "Please input an ID that You want to delete"
  delete_student = Students.new
  delete_student.id = gets.chomp.to_i

  found = Students.find_by_id(delete_student.id)
  failed = "Can't Find the ID" unless found

  if found
    Students.destroy_only_one(delete_student.id)
    puts "Student destroyed successfully!"
    puts " "
    puts "These are now the updated list now."
    Students.all.each do |element|
      puts element.display
    end
  else
    puts failed
  end
end

#COURSE MANAGEMENT
def add_course(id_number)
  new_course = Course.new
  new_course.id = id_number
  puts "Please input a course"
  new_course.name = gets.chomp
  new_course.save

  puts "Course added successfully!"
  Course.all.each do |element|
    puts element.display
  end
end

def delete_course
  puts "Please input an ID that You want to delete"
  delete_course = Course.new
  delete_course.id = gets.chomp.to_i

  found = Course.find_by_id(delete_course.id)
  failed = "Can't Find the ID" unless found

  if found
    Course.destroy_only_one(delete_course.id)
    puts "Course destroyed successfully!"
    puts " "
    puts "These are now the updated list now."
    Course.all.each do |element|
      puts element.display
    end
  else
    puts failed
  end
end

def add_subject(id_number)
  new_subject = Subject.new
  new_subject.id = id_number
  puts "Please input a subject"
  new_subject.name = gets.chomp
  new_subject.save

  puts "Subject added successfully!"
  Subject.all.each do |element|
    puts element.display
  end
end

def delete_subject
  puts "Please input an ID that You want to delete"
  delete_subject = Subject.new
  delete_subject.id = gets.chomp.to_i

  found = Subject.find_by_id(delete_subject.id)
  failed = "Can't Find the ID" unless found

  if found
    Subject.destroy_only_one(delete_subject.id)
    puts "Subject destroyed successfully!"
    puts " "
    puts "These are now the updated list now."
    Subject.all.each do |element|
      puts element.display
    end
  else
    puts failed
  end
end

continue = true
while continue
  puts "Please input "
  puts "[1] STUDENT MANAGEMENT"
  puts "[2] COURSE MANAGEMENT"
  puts "[3] SUBJECT MANAGEMENT"
  puts "[4] EXIT"
  action = gets.chomp.to_i

  case action
  when 1

    #If the user choose the STUDENT MANAGEMENT
    student_continue = true
    while student_continue
      puts "Please input "
      puts "[1] ADD A NEW STUDENT"
      puts "[2] DELETE A STUDENT"
      puts "[3] SHOW ALL THE STUDENTS"
      action = gets.chomp.to_i

      case action
      when 1
        add(student_id)
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        student_id += 1 if user_decision == "Y"
        student_continue = false if user_decision == "N"
      when 2
        delete
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      when 3
        Students.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      else
        puts "INVALID INPUT"
      end

    end
  when 2

    #If the user choose the COURSE MANAGEMENT
    course_continue = true
    while course_continue
      puts "Please input "
      puts "[1] ADD A NEW COURSE"
      puts "[2] DELETE A COURSE"
      puts "[3] SHOW ALL THE COURSE"
      action = gets.chomp.to_i

      case action
      when 1
        add_course(course_id)
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        course_id += 1 if user_decision == "Y"
        course_continue = false if user_decision == "N"
      when 2
        delete_course
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        course_continue = false if user_decision == "N"
      when 3
        Course.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        course_continue = false if user_decision == "N"
      else
        puts "INVALID INPUT"
      end
    end
  when 3

    #If the user choose the SUBJECT MANAGEMENT
    subject_continue = true
    while subject_continue
      puts "Please input "
      puts "[1] ADD A NEW SUBJECT"
      puts "[2] DELETE A SUBJECT"
      puts "[3] SHOW ALL THE SUBJECT"
      action = gets.chomp.to_i

      case action
      when 1
        add_subject(subject_id)
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        subject_id += 1 if user_decision == "Y"
        subject_continue = false if user_decision == "N"
      when 2
        delete_subject
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        subject_continue = false if user_decision == "N"
      when 3
        Subject.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue? Y/N"
        user_decision = gets.chomp.upcase
        subject_continue = false if user_decision == "N"
      else
        puts "INVALID INPUT"
      end
    end
  when 4

  when 5
    #If the user wants to EXIT
    continue = false
  end

end

