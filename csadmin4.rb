#!/usr/bin/env ruby

require 'rubygems'
#require  "login.rb"

require 'watir-webdriver'
require 'colorize'
#require 'mysql'

#Watir.options_file = '/nkrishnan/testconfig.yml'
browser = Watir::Browser.new :chrome
#browser = Watir::Browser.new

browser.goto 'https://qa02-csadmin.ustechsupport.com/session';
browser.cookies.clear
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
browser.link(:xpath,"//div[@id='customers-new-sales']/form/div[1]/div[2]/div[4]/table/tbody/tr[8]/td[7]/a").click;

#********* Randomize first name, last name, address  and credit cards *****************************
    fnames = ["Norton", "Mickey", "Johnny", "Denis", "Roma", "fischer", "Maxine"]
    lnames = ["Tammy", "Jenny", "Victor", "Nathan", "Bruce", "Mike", "Danny"]
    adress1 = ["2213 ", "7785 ", "4421 "]
    address1a = ["Los Angeles st", "Santa-Monica-st", "Torrance-st"]
    adress1x = adress1[rand(3)]
    adress1y = address1a[rand(3)]
    fnames1 = fnames[rand(7)]
    lnames1 = lnames[rand(7)]
    email = fnames1 + "." + lnames1 + Date.today.to_s + "@yopmail.com"
    date = Date.new
    acct_holder = fnames1 + " " + lnames1
    cc_no = ["4485424727154872", "4556365294373102", "4716623131797256", "4916619766778916", "4539886042479257", "4485248051169879"]
    cc_no1 = cc_no[rand(6)]

#******** Customer Information**************

    browser.text_field(:name, "customer[email_address]").set(email);
    browser.text_field(:name, "customer[first_name]").set(fnames1);
    browser.text_field(:name, "customer[last_name]").set(lnames1);

#****** Credit card Information ***************

    browser.text_field(:name, "credit_card[account_holder_name]").set(fnames1 + lnames1);
    browser.text_field(:name, "credit_card[account]").set(cc_no1);
    browser.select_list(:name => "credit_card[expiration_date_month]"); # I could not set this a month value    
    browser.select_list(:name, "credit_card[expiration_date_year]").select("2016"); # I could not set this to year value
    browser.text_field(:name, "credit_card[cvn]").set('321');

#******  Billing Information

    browser.text_field(:name, "billing_address[name]").set(fnames1 + lnames1);
    browser.text_field(:name, "billing_address[addr1]").set(adress1x + adress1y);
    browser.text_field(:name, "billing_address[city]").set("Torrance");
    browser.select_list(:xpath, "//div[@id='customers-new-sales']/form/table[3]/tbody/tr[8]/td/select[1]").select('California');
    browser.text_field(:name, "billing_address[postal_code]").set("90045");
    browser.text_field(:name, "billing_address[phone]").set("123-789-0001");

#***** Shipping Address

   browser.checkbox(:name, "enter_shipping_address").set
   browser.link(:text, "Copy from Billing Address").click;
   browser.button(:xpath, 'html/body/div[7]/div/form/div[2]/input[6]').click;  #Confirm button
#***** Incident Id, Call ID, Call Type and Comment
   incinum = rand(10000000000);
   callnum = rand(10000);
   calltype = ["Sales Queue", "Retention Queue", "Outbound Call"];
   calltype1 = calltype[rand(3)];
   browser.text_field(:name, "incident_number").set(incinum);
   browser.text_field(:name, "call_number").set(callnum);
   browser.select_list(:name, "call_type").select(calltype1);
   browser.text_field(:name, "comment").set("This is test for sales automation in cs-admin");
   browser.button(:xpath, 'html/body/div[10]/div[11]/div/button[1]').click;  #Submit button

#**** This confirmation is going to take a while so did catch the error
 begin
 rescue Timeout::Error => e
   browser.text.include? 'New sale has successfully been submitted'
   if true
     puts "Successfully created sales using automation".green
   else
     puts "problems creating sale using automation".red
  end
 end
browser.close

#******** Connecting to the database
#egin
#bh = Mysql.new('184.106.197.229', 'nkrishnan', 'aadhya99', 'ecom')
#  puts "Server version" + dbh.get_server_info + " " + "Connection to database possible".red

 #rescue Mysql::Error =>e
# puts "Error code" #{e.error}"
#  puts "Error message: #{e.error}"
#  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
#ensure

#***** Executing the query to check if the order-id is created
#begin
#  results = dbh.query "select order_id from sales order by created_at desc limit 1"
#   row = results.fetch_hash
#   puts "Order Id created in Database".green  + " " +  row ["order_id"].yellow
#end
# results.free

#*** clsoe the database connection
#bh.close if dbh

#nd
puts " Test is now complete ".green



