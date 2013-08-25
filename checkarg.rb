#!/usr/bin/env ruby
require 'rubygems'

def CheckArg(a,b)
 a = ARGV[0];
 b = ARGV[1];
end


   if ARGV[0] == 'prod' && ARGV[1] == 'ff'
     puts CheckArg("prod","ff") + ' ' + 'valid argument passed'
 else
   puts 'Invalid argumet passed'
   puts 'example - oprah.rb prod ff'
   exit
 end
 
