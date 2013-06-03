#!/usr/bin/env ruby

require 'rubygems'
require 'date'

class Date1
 #  def initialize(date1)
    date1 = Date.today
   end


class Time1
 #  def initialize(time1)
      time1 = Time.now
   end


t=Date1.new.to_s
m=Time1.new.to_s

puts t
puts m

 
  

