#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'selenium-webdriver'
require 'colorize'
require 'date'
puts "Starting Time now #{Time.now}".cyan

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180 # seconds – default is 60

browser = Watir::Browser.new :firefox, :http_client => client



#browser = Watir::Browser.new

browser.goto 'myown.oprah.com/register.html';

browser.cookies.clear


#f = File.open('output.txt', 'w')

#f.puts "open the file"


#begin

###############################

# check the tabs for OWN TV

##############################
#browser.link(:href, 'http://www.oprah.com/omagazine.html').wait_while_present(timeout=360);
#browser.link(:href, 'http://www.oprah.com/omagazine.html').click;

#sleep 2;
#browser.wait_until(browser.text.include?('O, THE OPRAH MAGAZINE'));
#browser.link(:href, 'http://myown.oprah.com/register.html').click;

 

#*****************************

# Randomization

#*****************************

#username = ["nkggggg", "nktttt", "nkrrrrr", "nklllll"]

o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten

username = (0...6).map{ o[rand(o.length)] }.join

day = Random.new.rand(10..30)

month = Random.new.rand(1..9)

#email = fnamesa + "." + lnamesa + Date.today.to_s + "@example.com"

email = username + Date.today.to_s + "@example.com"

#usernameb = usernamea + Date.today.to_s

 

 

#****************************

# Set field names in the form

#*****************************

browser.text_field(:name, "email_address").set(email);

browser.text_field(:name, "username").set(username);

browser.text_field(:name, "password").set("jackie12");

browser.text_field(:name, "password_confirm").set("jackie12");

sleep 3;

browser.select_list(:name, "birth_month").select(month);

browser.select_list(:name, "birth_dayofmonth").select(day);

browser.select_list(:name, "birth_year").select("1980");

browser.div(:id => 'agree_checkbox', :class => 'checkbox_icon').click;

browser.div(:class => 'btn_joinnow_ocom float', :id => 'submit_reg_btn').click;

browser.link(:href => "http://myown.oprah.com/logout.html");
sleep 10;

browser.div(:xpath => ".//*[@id='chk_73']").click;

browser.button(:id => "finish_btn", :class => "ocom_button_dark").click; 
puts "End Time now #{Time.now}".cyan

#browser.close

 

 

#rescue Exception => e

 # puts "Error nessage :"

#  puts e

#  puts 'problem with form submission'

#browser.close

#end
