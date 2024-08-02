class ExpenseTracker
    def initialize
      @expenses = []
    end
  
    def add_expense(amount, description)
      @expenses << { id: next_id, amount: amount, description: description }
      puts "Added expense: #{description} - Rs.#{amount}"
    end
  
    def list_expenses
      if @expenses.empty?
        puts "No expenses recorded."
      else
        puts "Expenses:"
        @expenses.each do |expense|
          puts "ID: #{expense[:id]} | Description: #{expense[:description]} | Amount: Rs.#{expense[:amount]}"
        end
      end
    end
  
    def update_expense(id, new_amount, new_description)
      expense = @expenses.find { |e| e[:id] == id }
      if expense
        expense[:amount] = new_amount
        expense[:description] = new_description
        puts "Updated expense ID: #{id} to #{new_description} - Rs.#{new_amount}"
      else
        puts "Expense with ID #{id} not found."
      end
    end
  
    def delete_expense(id)
      expense = @expenses.find { |e| e[:id] == id }
      if expense
        @expenses.delete(expense)
        puts "Deleted expense ID: #{id}"
      else
        puts "Expense with ID #{id} not found."
      end
    end
  
    def next_id
      @expenses.empty? ? 1 : @expenses.max_by { |e| e[:id] }[:id] + 1
    end
  
    def menu
      loop do
        puts "\nExpense Tracker Menu:"
        puts "1. Add Expense"
        puts "2. List Expenses"
        puts "3. Update Expense"
        puts "4. Delete Expense"
        puts "5. Exit"
        print "Choose an option: "
        choice = gets.chomp.to_i
  
        case choice
        when 1
          add_expense_prompt
        when 2
          list_expenses
        when 3
          update_expense_prompt
        when 4
          delete_expense_prompt
        when 5
          puts "Exiting..."
          break
        else
          puts "Invalid choice. Please select a number between 1 and 5."
        end
      end
    end
  
    private
  
    def add_expense_prompt
      print "Enter the amount: Rs."
      amount = gets.chomp.to_f
      print "Enter the description: "
      description = gets.chomp
      add_expense(amount, description)
    end
  
    def update_expense_prompt
      print "Enter the ID of the expense to update: "
      id = gets.chomp.to_i
      print "Enter the new amount: Rs."
      new_amount = gets.chomp.to_f
      print "Enter the new description: "
      new_description = gets.chomp
      update_expense(id, new_amount, new_description)
    end
  
    def delete_expense_prompt
      print "Enter the ID of the expense to delete: "
      id = gets.chomp.to_i
      delete_expense(id)
    end
  end
  
  tracker = ExpenseTracker.new
  tracker.menu
  