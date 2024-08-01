class TodoApp
    def initialize
      @tasks = []
    end
  
    def add_task(task)
      @tasks << task
      puts "Added task: '#{task}'"
    end
  
    def list_tasks
      if @tasks.empty?
        puts "No tasks available."
      else
        puts "Your tasks:"
        @tasks.each_with_index do |task, index|
          puts "#{index + 1}. #{task}"
        end
      end
    end
  
    def remove_task(index)
      if index.between?(1, @tasks.length)
        removed_task = @tasks.delete_at(index - 1)
        puts "Removed task: '#{removed_task}'"
      else
        puts "Invalid task number."
      end
    end
  
    def start
      loop do
        puts "\nTo-Do App"
        puts "1. Add Task"
        puts "2. List Tasks"
        puts "3. Remove Task"
        puts "4. Exit"
        print "Choose an option: "
        choice = gets.chomp.to_i
  
        case choice
        when 1
          print "Enter the task: "
          task = gets.chomp
          add_task(task)
        when 2
          list_tasks
        when 3
          print "Enter the task number to remove: "
          task_number = gets.chomp.to_i
          remove_task(task_number)
        when 4
          puts "Exitinjg the To-Do App."
          break
        else
          puts "Invalid choice. Please try again."
        end
      end
    end
  end
  
  TodoApp.new.start