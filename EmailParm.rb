#!/usr/bin/env ruby

require 'rubygems'

class Email
   def Initialize
     @email = 'naveenkrishnan'
   end


  def Email(email)
     email.to_sym
 end
end

@t=Email.new
#.to_s
puts @t


