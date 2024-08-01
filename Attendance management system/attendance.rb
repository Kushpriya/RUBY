class Attendance
    def initialize(file_path)
      @file_path = file_path
      @students = []
      load_data
    end
  
    def add_student(name)
      student = Student.new(name)
      @students << student
      save_data
    end
  
    def mark_attendance(name, date)
      student = @students.find { |s| s.name == name }
      if student
        student.mark_attendance(date)
        save_data
      else
        puts "Student not found."
      end
    end
  
    def list_attendance
      @students.each { |student| puts student }
    end
  
    private
  
    def load_data
      return unless File.exist?(@file_path)
      
      File.readlines(@file_path).each do |line|
        name, dates = line.chomp.split(': ')
        student = Student.new(name)
        student.attendance = dates.split(', ')
        @students << student
      end
    end
  
    def save_data
      File.open(@file_path, 'w') do |file|
        @students.each do |student|
          file.puts "#{student.name}: #{student.attendance.join(', ')}"
        end
      end
    end
  end
  