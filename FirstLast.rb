#!/usr/bin/env ruby

require 'rubygems'

class First
   def first
     @firstname =  'Naveen'
   end
end

class Last < First
   def last
     @lastname = 'Krishnan'
   end
end

t=Last.new
s=t.first
m=t.last
puts s +' ' +  m





