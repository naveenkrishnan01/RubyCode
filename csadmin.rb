#!/usr/bin/env ruby

require 'rubygems'
#require  "login.rb"

require 'watir-webdriver'
require 'colorize'

#Watir.options_file = '/nkrishnan/testconfig.yml'
#browser = Watir::Browser.new :chrome
browser = Watir::Browser.new
browser.goto 'https://qa02-csadmin.ustechsupport.com/session';
browser.text_field(:name, "username").set("qa-admin");
browser.text_field(:name, "password").set("ortvu6KD");
browser.button(:name, "submit").click;

browser.text.include? 'How are you today?'
if true
 puts "successfully logged in".yellow
else
 puts "problems logging in"
end

browser.select(:class, "search_type").click;

browser.select_list(:name, 'search_type').click
browser.text_field(:name, "email_address").set("devtesttnt007.cyde01@yopmail.com");
browser.button(:value, 'Search').click

require "test/unit/assertions"
include Test::Unit::Assertions

begin
 assert(browser.link(:text, "769-699-282").exists?)

if true
  puts "Order id exists for this email".yellow
  browser.link(:text, "769-699-282").click
else
  puts "Order Id NOT found"
 end
end

browser.text.include? 'USTechSupport Customer Service Administration Version 3.0'
 if true
  puts 'Footer verification done'.red
 else
  puts 'Footer is missing'
end

#browser.link(:href, "https://qa02-csadmin.ustechsupport.com/customers/new/sales").click;
browser.link(:text, "New Customer Sale").click;
browser.link(:text, "LiveTech").click;
browser.link(:xpath,"//div[@id='customers-new-sales']/form/div[1]/div[2]/div[3]/table/tbody/tr[8]/td[7]/a").click;

<script type="text/javascript">
function makeEnable() {
  var x=document.getElementById('district-us')
x.disabled=true 
}
</script>
selectList=browser.select_list(:name, 'billing_address[district]');
    SelectContent = selectList.options.map(&:text);
   # store = browser.select_list(:name, 'billing_address[district]').value == SelectContent[5];
    browser.select_list(:name => 'billing_address[district]', :index => SelectContent[5]);
   # browser.select_list(:name, 'billing_address[district]').selected_options.first;

#    browser.text_field(:name, "billing_address[postal_code]").set("90045");
#    browser.text_field(:name, "billing_address[phone]").set("123-789-0001");


#browser.close
puts " Test is now complete ".green



