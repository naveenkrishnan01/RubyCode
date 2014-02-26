#require 'pry'
require 'colorize'

def shout(msg)
   puts "=> #{msg}"
end

shout "what is the first number?"
number1 = gets.chomp

shout " The number was " + number1

shout "what is the second nnumber?"
number2 = gets.chomp

shout " The number was " + number2

shout " The computer is now randomly choosing an operation..."

arr = ["1", "2", "3", "4"]
operator = arr[rand(4)]

#binding.pry

if operator ==  '1'
   result = number1.to_i + number2.to_i
   operator = "add"
elsif operator == '2'
   result = number1.to_i - number2.to_i
   operator = "subtract"
elsif operator == '3'
   result = number1.to_i * number2.to_i
   operator = "multiply"
else result = number1.to_f / number2.to_f
    operator = "divide"
 end

  shout " The result for the #{operator} is #{result}".green

 


