require_relative 'students'
require_relative 'course'

student_id = 1
course_id = 1

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
    puts "Successfully Destroyed"
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
  puts "Please input a name"
  new_course.name = gets.chomp
  puts "Please input birthday"
  new_course.birth_date = gets.chomp
  puts "Please input email"
  new_course.email = gets.chomp
  puts "Please input phone number"
  new_course.phone_number = gets.chomp.to_i
  new_course.save

  Course.all.each do |element|
    puts element.display
  end
end




continue = true
while continue
  puts "Please input "
  puts "[1] STUDENT MANAGEMENT"
  puts "[2] COURSE MANAGEMENT"
  puts "[3] EXIT"
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
        id += 1 if user_decision == "Y"
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
        id += 1 if user_decision == "Y"
        course_continue = false if user_decision == "N"
      when 2
        delete
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
    #If the user wants to EXIT
    continue = false
  end

end

