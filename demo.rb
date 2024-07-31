foods = {
    burger:4,
    pizza:3,
    chowmein:2,
    momo:10
}

puts "what would you like to do?"
  puts "If you want to add food then enter 1"
  puts "To update enter 2"
  puts "To delete enter 3"
  puts "To display enter 4"
  
 choice = gets.chomp
 case choice
 when "1"
    puts "which food do you want to add?"
        food_name = gets.chomp.to_sym
        puts "Give rating to the food?" 
        rating = gets.chomp.to_i
        puts "you added #{food_name} gave rating #{rating}"
        
    end

