#!/usr/bin/ruby
require 'rubygems'
require 'watir-webdriver'

class Env
  
   def init_check test1
    @test1 =  ARGV[0]
   end

   def get_env 
     if @test1 == 'ie'
       env = 'ie'
     elsif
       @test1 == 'chrome'
       env = 'chrome'
      else
       env = 'firefox' 
     end
     return env
end
end
# c = Env.new
#  c.init_check @test1
# puts c.get_env 
#puts @browser

