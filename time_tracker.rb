require 'date'

class TimeTracker
  def initialize
    @tasks = {}
  end

  def start_task(name)
    if @tasks.key?(name)
      puts "Task '#{name}' is already running."
    else
      @tasks[name] = { start_time: Time.now, end_time: nil }
      puts "Task '#{name}' started at #{current_time}."
    end
  end

  def stop_task(name)
    if @tasks.key?(name)
      if @tasks[name][:end_time]
        puts "Task '#{name}' is already stopped."
      else
        @tasks[name][:end_time] = Time.now
        puts "Task '#{name}' stopped at #{current_time}."
      end
    else
      puts "Task '#{name}' not found."
    end
  end

  def show_task(name)
    if @tasks.key?(name)
      task = @tasks[name]
      if task[:end_time]
        duration = task[:end_time] - task[:start_time]
        puts "Task '#{name}' started at #{task[:start_time].strftime('%Y-%m-%d %H:%M:%S')}, ended at #{task[:end_time].strftime('%Y-%m-%d %H:%M:%S')}, duration: #{format_duration(duration)}."
      else
        puts "Task '#{name}' is still running."
      end
    else
      puts "Task '#{name}' not found."
    end
  end

  def list_tasks
    if @tasks.empty?
      puts "No tasks found."
    else
      @tasks.each do |name, task|
        if task[:end_time]
          duration = task[:end_time] - task[:start_time]
          puts "Task '#{name}' started at #{task[:start_time].strftime('%Y-%m-%d %H:%M:%S')}, ended at #{task[:end_time].strftime('%Y-%m-%d %H:%M:%S')}, duration: #{format_duration(duration)}."
        else
          puts "Task '#{name}' started at #{task[:start_time].strftime('%Y-%m-%d %H:%M:%S')}, still running."
        end
      end
    end
  end

  private

  def current_time
    Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end

  def format_duration(seconds)
    hours = (seconds / 3600).to_i
    minutes = ((seconds % 3600) / 60).to_i
    seconds = (seconds % 60).to_i
    "#{hours}h #{minutes}m #{seconds}s"
  end
end

time_tracker = TimeTracker.new

def prompt
  puts "\nTime Tracker Menu:"
  puts "1. Start Task"
  puts "2. Stop Task"
  puts "3. Show Task"
  puts "4. List Tasks"
  puts "5. Exit"
  print "Choose an option (1-5): "
end

loop do
  prompt
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter task name to start: "
    name = gets.chomp
    time_tracker.start_task(name)
  when 2
    print "Enter task name to stop: "
    name = gets.chomp
    time_tracker.stop_task(name)
  when 3
    print "Enter task name to show: "
    name = gets.chomp
    time_tracker.show_task(name)
  when 4
    time_tracker.list_tasks
  when 5
    puts "Exiting..."
    break
  else
    puts "Invalid choice. Please select a number between 1 and 5."
  end
end
