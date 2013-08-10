#!/usr/bin/env ruby
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

