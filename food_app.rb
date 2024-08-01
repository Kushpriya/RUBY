foods = {
    burger:4,
    pizza:3,
    chowmein:2,
    momo:10
}

def start
    loop do
    puts "FOOD APP"
  puts "1. Add Foods"
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
        puts "you added #{food_name} gave rating #{rating}"
    
    when 2
    puts "which food do you want to update?"

    when 3
    puts "which food do you want to delete?"

    when 4
    puts "which food do you want to display?"

    end
end

