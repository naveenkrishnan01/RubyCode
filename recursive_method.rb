# This is recursive method example

def check_age question
  puts question
  age = gets.chomp
  if age.to_i >= 18 and age.to_i <= 40
    puts "Your belong to genY generation"
  elsif age.to_i >= 40 and age.to_i <= 55
    puts " You belong to genX generation"
  else age.to_i <= 17 and age.to_i >= 56
    puts "You should be between 18 and 55"
    check_age question # recursive method
  end
end

check_age "What is your age ?"
