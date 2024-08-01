require_relative 'student'
require_relative 'attendance'

attendance = Attendance.new('attendance.txt')

loop do
  puts "1. Add student"
  puts "2. Mark attendance"
  puts "3. List attendance"
  puts "4. Exit"
  print "Choose an option: "
  option = gets.chomp.to_i

  case option
  when 1
    print "Enter student name: "
    name = gets.chomp
    attendance.add_student(name)
  when 2
    print "Enter student name: "
    name = gets.chomp
    print "Enter date (YYYY-MM-DD): "
    date = gets.chomp
    attendance.mark_attendance(name, date)
  when 3
    attendance.list_attendance
  when 4
    break
  else
    puts "Invalid option. Please try again."
  end
end
