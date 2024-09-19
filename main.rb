require_relative 'students'



def add
  new_student = Students.new
  new_student.id = 0

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

puts "Please input "
puts "[1] ADD A NEW STUDENT"
puts "[2] DELETE A STUDENT"

action = gets.chomp.to_i

continue = true
while continue
  case action
  when 1
    add
    puts "Do You want to continue? Y/N"
    user_decision = gets.chomp.upcase
    continue = false if user_decision == "N"
  end
end