#!/usr/bin/env ruby
require 'rubygems'

class Name
def pass_something(aName,aLastName)
   @aName = ARGV[1].to_s
   @aLastName = ARGV[0].to_s 
end
end
t = Name.new
a = t.pass_something(@aName,@aLastName) 
 puts a



     
