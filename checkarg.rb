#!/usr/bin/env ruby
require 'rubygems'
require 'watir-webdriver'

def CheckArg(a,b)
 a = ARGV[0];
 b = ARGV[1];
end


   if ARGV[0] == 'prod' && ARGV[1] == 'ff'
     puts CheckArg("prod","ff") + ' ' + 'valid argument passed'
 else
   if ARGV[0] == 'prod' && ARGV[1] == 'chrome'
     puts CheckArg("prod","ff") + ' ' + 'valid argument passed'
   else
   puts 'Invalid argumet passed'
   puts 'example - oprah.rb prod ff'
   exit
 end
end 
   if ARGV[1] = 'ff'
      browser = Watir::Browser.new
   end
 
