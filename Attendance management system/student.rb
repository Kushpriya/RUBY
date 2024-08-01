class Student
    attr_accessor :name, :attendance
  
    def initialize(name)
      @name = name
      @attendance = []
    end
  
    def mark_attendance(date)
      @attendance << date
    end
  
    def to_s
      "#{@name}: #{@attendance.join(', ')}"
    end
  end