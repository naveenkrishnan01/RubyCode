#!/usr/bin/env ruby
<<<<<<< HEAD

require 'rubygems'

require 'watir-webdriver'
require 'colorize'

require './sikuli.rb'

#*************************************************************************************************************************
#  *** If you run ito issues , please clear cache on the browser and 'unfollow the event' especially if you run second time
#  *** I created the account manually first time , because if the test need to be repeated then it makes sense to have
#  *** signed up account.
#************************************************************************************************************************** 
#  browser = Selenium::WebDriver.for :chrome

browser = Watir::Browser.new :chrome

#browser = Watir::Browser.new
browser.goto 'www.oprah.com';
sleep 2;

browser.link(:title, "Videos").click;
sleep 2;

browser.img(:title, "Wanda Sykes Herlarious").click;

sleep 2;

#browser.close
puts "Test is now complete".green


#*********************************************************************************************************************
# * Potential issue on test, if it fails to locate My Alert tab, need to clear browser , run the test second time which
# *may fail under webdriver browser, you need to manually 'unfollow the event', then run the script again
#**********************************************************************************************************************
                                                                                                                         
=======
require 'rubygems'

require 'watir-webdriver'

#require 'selenium-webdriver'

#require 'colorize'

require 'date'

require 'json'
client = Selenium::WebDriver::Remote::Http::Default.new

client.timeout = 500 #

#puts "Starting Time now #{Time.now}".cyan

browser = Watir::Browser.new 
browser.goto "http://www.oprah.com";

browser.cookies.clear


begin

sleep 10;
###############################
# Click Owners Exclusive
##############################

browser.element(:xpath, ".//*[@id='left_col_large_image_promo_content']/div[2]/div[1]/a/img").click

sleep 5;

#****************************
# Set field names in the form
#*****************************

browser.text_field(:name, "login_email_username").set("naveenkris009@yahoo.com");

browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onBlur");

sleep 5;

#browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onSelect");

sleep 6;

browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onfocus");
browser.text_field(:id => "login_password_text", :class => "reg_input_field input_default_text").fire_event("onClick");
sleep 10;

#browser.confirm(true) {browser.text.click}
browser.execute_script("document.getElementById('login_password_text').style.display='none';")
browser.text_field(:name => "login_password_text", :class => "reg_input_field input_default_text").when_present.set("hello123")
#browser.text_field(:name => "login_password_text").when_present.set("hello123")

#browser.text_field(:name => "login_password_text").when_present.set("hello123");
#browser.div(:id => "owners_submit_login_btn").click;

sleep 3;

#*************************

# click the news letter page and submit

#**************************
end
 

#****************************

# click the account settings and manage_news_letter to validate

#*******************************

puts "Test now complete for Qestionnare "

 

#puts "End Time now #{Time.now}".cyan

#puts "#{email}";

 

#browser.close
>>>>>>> 8c7669eb1e5349207a8600dfe4a9749f4ca37d46

