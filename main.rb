require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

student_id = 3
course_id = 3
subject_id = 3
teacher_id = 3

#STUDENT MANAGEMENT
def add(id_number)
  new_student = Student.new
  new_student.id = id_number

  puts "Please input a name"
  new_student.name = gets.chomp

  puts "Please input birthday"
  new_student.birth_date = gets.chomp
  
  puts "Please input email"
  new_student.email = gets.chomp

  puts "Please input phone number"
  new_student.phone_number = gets.chomp.to_i

  puts "These are available courses. Please choose one"
  Course.all.each do |element|
    puts element.display
  end

  puts "Please input the ID of the course you want"
  new_student.course_id = gets.chomp.to_i

  course_found = Course.find_by_id(new_student.course_id)
  new_student.course_id = course_found.name

  new_student.save

  puts "Student added successfully!"
  Student.all.each do |element|
    puts element.display
  end
end

def delete
  puts "Please input an ID that You want to delete"
  delete_student = Student.new
  delete_student.id = gets.chomp.to_i

  found = Student.find_by_id(delete_student.id)
  failed = "Can't Find the ID" unless found

  if found
    Student.destroy(delete_student.id)
    puts "Student destroyed successfully!"
    puts " "
    puts "These are now the updated list now."

    Student.all.each do |element|
     puts element.display
    end
  else
    puts failed
  end
end

def update_student
  puts "Please input an ID that you want to update"
  id_input = gets.chomp.to_i
  student_data = Student.find_by_id(id_input)
  isfound = "Can't Find ID or invalid input" if student_data == nil

  if student_data
    puts "Please input an new name"
    student_data.name = gets.chomp

    puts "Please input an new birthdate"
    student_data.birth_date = gets.chomp

    puts "Please input an new email"
    student_data.email = gets.chomp

    puts "Please input an new phone number"
    student_data.phone_number = gets.chomp

    puts "Updated Successfully!"
    puts student_data.display
  else
    puts isfound
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
    Course.destroy(delete_course.id)
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

def update_course
  puts "Please input an ID that you want to update"
  id_input = gets.chomp.to_i
  course_data = Course.find_by_id(id_input)
  isfound = "Can't Find ID or invalid input" if course_data == nil

  if course_data
    puts "Please input an new course"
    course_data.name = gets.chomp

    puts "Updated Successfully!"
    puts course_data.display
  else
    puts isfound
  end
end


#SUBJECT MANAGEMENT
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
    Subject.destroy(delete_subject.id)
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

def update_subject
  puts "Please input an ID that you want to update"
  id_input = gets.chomp.to_i
  subject_data = Subject.find_by_id(id_input)
  isfound = "Can't Find ID or invalid input" if subject_data == nil

  if subject_data
    puts "Please input an new course"
    subject_data.name = gets.chomp

    puts "Updated Successfully!"
    puts subject_data.display
  else
    puts isfound
  end
end

#TEACHER MANAGEMENT
def add_teacher(id_number)
  new_teacher = Teacher.new
  new_teacher.id = id_number
  puts "Please input a name"
  new_teacher.name = gets.chomp
  puts "Please input birthday"
  new_teacher.birth_date = gets.chomp
  puts "Please input email"
  new_teacher.email = gets.chomp
  puts "Please input phone number"
  new_teacher.phone_number = gets.chomp.to_i
  puts "Please input phone the department"
  new_teacher.department = gets.chomp
  new_student.save

  puts "Teacher added successfully!"
  Teacher.all.each do |element|
    puts element.display
  end
end

def delete_teacher
  puts "Please input an ID that You want to delete"
  delete_teacher = Teacher.new
  delete_teacher.id = gets.chomp.to_i

  found = Teacher.find_by_id(delete_teacher.id)
  failed = "Can't Find the ID" unless found

  if found
    Teacher.destroy_only_one(delete_teacher.id)
    puts "Teacher destroyed successfully!"
    puts " "
    puts "These are now the updated list now."
    Teacher.all.each do |element|
      puts element.display
    end
  else
    puts failed
  end
end

def update_teacher
  puts "Please input an ID that you want to update"
  id_input = gets.chomp.to_i
  teacher_data = Teacher.find_by_id(id_input)
  isfound = "Can't Find ID or invalid input" if teacher_data == nil

  if teacher_data
    puts "Please input an new name"
    teacher_data.name = gets.chomp

    puts "Please input an new birthdate"
    teacher_data.birth_date = gets.chomp

    puts "Please input an new email"
    teacher_data.email = gets.chomp

    puts "Please input an new phone number"
    teacher_data.phone_number = gets.chomp

    puts "Please input an new department"
    teacher_data.department = gets.chomp

    puts "Updated Successfully!"
    puts teacher_data.display
  else
    puts isfound
  end
end


continue = true
while continue
  puts "Please input "
  puts "[1] STUDENT MANAGEMENT"
  puts "[2] COURSE MANAGEMENT"
  puts "[3] SUBJECT MANAGEMENT"
  puts "[4] Teacher MANAGEMENT"
  puts "[5] EXIT"
  action = gets.chomp.to_i

  case action
  when 1

    #If the user choose the STUDENT MANAGEMENT
    student_continue = true
    while student_continue
      puts "Please input "
      puts "[1] ADD A NEW STUDENT"
      puts "[2] DELETE A STUDENT"
      puts "[3] UPDATE STUDENT"
      puts "[4] SHOW ALL THE STUDENTS"
      action = gets.chomp.to_i

      case action
      when 1
        add(student_id)
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        student_id += 1 if user_decision == "Y"
        student_continue = false if user_decision == "N"
      when 2
        delete
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      when 3
        update_student
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      when 4
        Student.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue or go back to managements section? Y/N"
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
      puts "[3] UPDATE STUDENT"
      puts "[4] SHOW ALL THE COURSE"
      action = gets.chomp.to_i

      case action
      when 1
        add_course(course_id)
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        course_id += 1 if user_decision == "Y"
        course_continue = false if user_decision == "N"
      when 2
        delete_course
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        course_continue = false if user_decision == "N"
      when 3
        update_course
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      when 4
        Course.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue or go back to managements section? Y/N"
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
      puts "[3] UPDATE SUBJECT"
      puts "[4] SHOW ALL THE SUBJECT"
      action = gets.chomp.to_i

      case action
      when 1
        add_subject(subject_id)
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        subject_id += 1 if user_decision == "Y"
        subject_continue = false if user_decision == "N"
      when 2
        delete_subject
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        subject_continue = false if user_decision == "N"
      when 3
        update_subject
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      when 4
        Subject.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        subject_continue = false if user_decision == "N"
      else
        puts "INVALID INPUT"
      end
    end
  when 4

    #If the user choose TEACHER MANAGEMENT
    teacher_continue = true
    while teacher_continue
      puts "Please input "
      puts "[1] ADD A NEW TEACHER"
      puts "[2] DELETE A TEACHER"
      puts "[3] UPDATE TEACHER"
      puts "[4] SHOW ALL THE TEACHER"
      action = gets.chomp.to_i

      case action
      when 1
        add(teacher_id)
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        teacher_id += 1 if user_decision == "Y"
        teacher_continue = false if user_decision == "N"
      when 2
        delete teacher
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        teacher_continue = false if user_decision == "N"
      when 3
        update_teacher
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        student_continue = false if user_decision == "N"
      when 4
        Teacher.all.each do |element|
          puts element.display
        end
        puts "Do You want to continue or go back to managements section? Y/N"
        user_decision = gets.chomp.upcase
        teacher_continue = false if user_decision == "N"
      else
        puts "INVALID INPUT"
      end
    end
  when 5

    #If the user wants to EXIT
    continue = false
  end

end

