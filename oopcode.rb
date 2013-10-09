# classes and objects
# behaviour and states

# classes contains behaviours (methods)
# object constain states (instance variable)
class Cat
 # The attr_accessor replaces the getter and setter method
  attr_accessor :name, :color

   @@count = 0   # This is class variable

  def self.total_cats  # This is class method
   "Total number of cats: #{@@count}"
  end

  def initialize(n, m)
  # instance variables
    @name = n
    @color = m
    @@count += 1
  end 
 
# instance method
  def meow
   # puts @name + ' meowed'
   # for consistency remove puts
    #puts @name + ' meowed'
    "#{@name}   meowed"
  end

  def hair
    #puts @name + " color of hair is #{@color}"
   # for consistency remove puts
   "#{@name}  color of hair is #{@color}"
  end
  # Difference is no puts in front of getter
 # def name
 #   @name
 # end

  # setter method: when method name is identical to ivar, with a equal sign
  #def name=(new_name)
   #  @name = new_name
  #end
   def change_hair(n, m)
        self.name = n
        self.color = m
   end
end
#Instantiating an object 
 dolly = Cat.new('dolly', 'brown')
 roger = Cat.new('roger', 'white')

 puts dolly.meow
 puts roger.meow

 puts dolly.hair
 puts roger.hair

 puts dolly.name
 dolly.name = "Maxine"
 puts  "Name changed to " + dolly.name
 puts dolly.name +  " " + "hair color is" + " " +  dolly.color

 dolly.change_hair("Morris", "black")
 puts dolly.hair
 puts Cat.total_cats  # Display class methods
