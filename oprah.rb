#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require './checkArg'
require 'date'
require 'json'

configuration = JSON.parse(File.read('./conf.json'))
url = configuration["url"]
browser_type = configuration["browser_type"]
count_text = 0;
puts "Starting Time now #{Time.now}"

if configuration["browser_type"] == "Firefox"  
browser = Watir::Browser.new 
else
browser = Watir::Browser.new browser_type
end  

browser.goto url;
browser.cookies.clear

f = File.open('output.txt', 'w')
f.puts "open the file"
browser.text.include? 'Welcome to Oprah.com'
if true
puts "Found the Oprah Home page".yellow
count_text += 1
else
 puts "Having problems"
end

browser.close
puts " Test is now complete ".green
f.puts "Test is now complete "
f.puts "Total count for text validation on the page: #{count_text}"
f.puts "Ending time now #{Time.now}"
f.close


