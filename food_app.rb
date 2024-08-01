class FoodApp
    def initialize
        @foods = []
    end

    def add_task(food_name, rating)
        @foods << {name: food_name ,rating:rating}
        puts "you added #{food_name} with rating #{rating}"
    end

    def display_food
        if @foods.empty?
            puts "No food available."
        else
            puts "Your added foods:"
            puts "S.N   Foods\t Rating"
            @foods.each_with_index do |food, index|
        puts "#{index + 1}.    #{food[:name]} \t #{food[:rating]}"
            end
        end
    end 
    
    def remove_food(index)
        if index.between?(1,@foods.length)
            remove_food = @foods.delete_at(index-1)
            puts "Removed food: '#{remove_food[:name]}' with rating #{remove_food[:rating]}."
        else
            puts "Invalid food number. Please choose a number between 1 and #{@foods.length}."
        end
    end

    def update_food(index)
        if index.between?(1, @foods.length)
            puts "Updating food number #{index}: '#{@foods[index - 1][:name]}'"
            puts "Enter new name (or press Enter to keep '#{@foods[index - 1][:name]}'):"
            new_name = gets.chomp
            new_name = @foods[index - 1][:name] if new_name.empty?

            puts "Enter new rating (or press Enter to keep #{@foods[index - 1][:rating]}):"
            new_rating = gets.chomp
            new_rating = @foods[index - 1][:rating] if new_rating.empty?
            new_rating = new_rating.to_i

            @foods[index - 1] = { name: new_name, rating: new_rating }
            puts "Updated food to '#{new_name}' with rating #{new_rating}."
        else
            puts "Invalid food number. Please try again."
        end
    end

    def start
        puts "\nFOOD APP"
        puts "-----------"
        loop do
            puts "\n1. Add Foods"
            puts "2. Display Foods"
            puts "3. Remove Foods"
            puts "4. Update Foods"
            puts "5. Exit"
            puts "Choose an option: "
            choice = gets.chomp.to_i
  
            case choice
            when 1
                puts "which food do you want to add?"
                food_name = gets.chomp.to_sym
                puts "Give rating to the food?" 
                rating = gets.chomp.to_i
                add_task(food_name,rating)
                    
            when 2
                display_food

            when 3
                puts "which food number do you want to remove?"
                    food_number = gets.chomp.to_i
                    remove_food(food_number)
            when 4
                puts "which food number do you want to update?"
                food_number = gets.chomp.to_i
                update_food(food_number)
            when 5
                break
            else
                puts "Invalid choice. Please try again!"
            end
        end
    end
end

FoodApp.new.start