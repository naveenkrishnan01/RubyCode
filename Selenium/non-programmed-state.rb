#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require_relative '../Global/setupconfig.rb'
require_relative '../Global/o20vars.rb'

CurrentVars = O20Vars.new

printTime("Start:")

startDriver()

test_pages = ["OWNTV","SUPERSOULSUNDAY","HAVESANDHAVENOTS", "LOVETHYNEIGHBOR", "OPRAHPRIME", "IYANLA", "RAISINGWHITLEY", "SIXLITTLEMCGHEES", 
              "FORBETTERORWORSE", "LATOYA", "HOMEMADESIMPLE", "LISALING"]
# add back SUPERSOULSUNDAY after OWNTV in the array

test_urls = {}
test_pages.each do |test_page|
  test_urls[test_page] = CurrentVars.getVar(test_page)
end

test_urls.each do |page_name, url|

open(getEnv() + url)
sleep (3)

driver = getCurrentDriver()
@status= false


#Begin test for channel Finder
###############################
# Channel Finder
##############################
sleep 3;
#click the drop down fron the channnel section
begin  
    if page_name == "OWNTV"
        l = driver.find_element(:xpath, ".//*[@id='tvschedule']/div[1]/div[3]/div[3]")
   else
        l = driver.find_element(:xpath, ".//*[@id='watch_on_own']/p")
   end
l.click;
puts " "
puts "Drop Down exists for channel click for #{page_name}" 
result = l.nil? ? "FAIL" : "PASS"
puts "RESULTS:" + result
sleep 4;

#enter Zipcode for textbox
x = driver.find_element(:name, "zip").send_keys '90045'
puts "Enter zipcode in the text box for #{page_name}"
sleep 2;

# Select Provider from the drop down
 if page_name == "OWNTV"
   Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, ".//*[@id='tv-schedule-container']/div/div/form[1]/div[3]/select")).select_by(:text, "DISH Network");
   puts " Selected Service provider DISH NETWORK for #{page_name}"
 else  
   Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, ".//*[@id='show_subheader']/div[2]/div[4]/div/form[1]/div[3]/select")).select_by(:text, "DIRECTV");
   puts " Selected Service Provider DIRECTV for #{page_name}"
 end  
sleep 2;

#Click on the "Find it" button
if page_name == "OWNTV"
j = driver.find_element(:xpath, ".//*[@id='tv-schedule-container']/div/div/form[1]/div[4]/button");
elsif
j = driver.find_element(:xpath, ".//*[@id='show_subheader']/div[2]/div[4]/div/form[1]/div[4]/button");
end
j.click;
puts "Clicked on the Find It button for channel finder for #{page_name}"
result = j.nil? ? "FAIL" : "PASS"
puts "RESULTS:" + result
sleep 2;
rescue => e
  puts " "	
  puts "Issue found on the page #{page_name}. Please check this page manually"
  puts "RESULTS: FAIL"
end
end

#teardown
 @status = "true"
  if ARGV[1] == 'local'
    endTest()
     printTime("End:")
  exit
end

#teardown for the saucelab 
setTestStatus(@status)
 endTest()
printTime("End:")


