 module Cubeable  # use 'able' in the end for modules
   def cube
     puts "#{sides} cube has 2 times square"
   end
 end
  module Cylindrable
   def cylinder   # example to show ancestors
    puts "#{sides} cylinder has no sides"
  end
end

   module Figurable  # example of module at superclass level
    def figure
      puts "#{sides} is considred figure with 4 sides"
    end
   end

class Foursides
  include Figurable # module at superclass
  attr_accessor :sides

 def initialize(sides)
   @sides = sides
 end
 
 def number_of_sides
   puts sides + "There are 4 sides "
 end
end
 
 class Square < Foursides
    include Cubeable # mixing in a module
    include Cylindrable # check the ancestor. This will be reported first 

   def equal
     puts " 4 sides are equal"
   end
 end

 class Rectangle < Foursides
  def unequal_sides?
   true
  end
 end

  square     = Square.new('square')
  rectangle  = Rectangle.new('rectangle')

  puts square.sides
  puts rectangle.sides

  #square.number_of_sides
  square.equal
  rectangle.number_of_sides
 puts rectangle.unequal_sides?

  square.cube
  square.cylinder  
  square.figure 
 # rectangele.cube -- This will fail because there is no mixing injection here

  puts "======------"
  puts Square.ancestors
