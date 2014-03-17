#!/usr/bicolorin/env ruby

require 'rubygems'
require 'colorize'

module Setup

  if ARGV[0] == nil or ARGV[0] != "qa"
    puts 'Please enter qa as argument after the code'.green
    puts ' Example : ruby <program name>.rb qa '.green
  exit
  elsif
   ARGV[0] == "qa"
   puts 'the argument passed is correct'.yellow
  end
 end


