#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'
require './checkArg'
require 'date'

puts "Starting Time now #{Time.now}"
  
browser = Watir::Browser.new :chrome

browser.goto 'www.oprah.com';
browser.cookies.clear

f = File.open('output.txt', 'w')
f.puts "open the file"
#browser.text.include? 'How are you today?'
#if true
# puts "successfully logged in".yellow
#else
# puts "problems logging in"
#end

#browser.select(:class, "search_type").click;

#browser.select_list(:name, 'search_type').click
#begin
# assert(browser.link(:text, "769-699-282").exists?)

#if true
#  puts "Order id exists for this email".yellow
#  browser.link(:text, "769-699-282").click
#else
#  puts "Order Id NOT found"
# end
#end

#browser.text.include? 'USTechSupport Customer Service Administration Version 3.0'
# if true
#  puts 'Footer verification done'.red
# else
#  puts 'Footer is missing'
#end

#browser.link(:text, "New Customer Sale").click;
#browser.link(:text, "LiveTech").click;
#browser.link(:xpath,"//div[@id='customers-new-sales']/form/div[1]/div[2]/div[4]/table/tbody/tr[8]/td[7]/a").click;


#**** This confirmation is going to take a while so did catch the error
# begin
# rescue Timeout::Error => e
#   browser.text.include? 'New sale has successfully been submitted'
#   if true
#     puts "Successfully created sales using automation".green
#   else
#     puts "problems creating sale using automation".red
#  end
# end
browser.close
puts " Test is now complete ".green
f.puts "Test is now complete "
puts "Ending time now #{Time.now}"
f.close


