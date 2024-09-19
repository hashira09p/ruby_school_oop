require_relative 'students'
id = 1

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

  id_number += 1

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

continue = true
while continue
  puts "Please input "
  puts "[1] ADD A NEW STUDENT"
  puts "[2] DELETE A STUDENT"
  puts "[3] SHOW THE STUDENTS"
  action = gets.chomp.to_i

  case action
  when 1
    add(id)
    puts "Do You want to continue? Y/N"
    user_decision = gets.chomp.upcase
    id += 1 if user_decision == "Y"
    continue = false if user_decision == "N"
  when 2
    delete
    puts "Do You want to continue? Y/N"
    user_decision = gets.chomp.upcase
    continue = false if user_decision == "N"
  when 3
    Students.all.each do |element|
      puts element.display
    end
    puts "Do You want to continue? Y/N"
    user_decision = gets.chomp.upcase
    continue = false if user_decision == "N"
  end
end