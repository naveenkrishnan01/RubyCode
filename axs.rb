#!/usr/bin/env ruby

require 'rubygems'

require 'watir-webdriver'
require 'colorize'

#*************************************************************************************************************************
#  *** If you run ito issues , please clear cache on the browser and 'unfollow the event' especially if you run second time
#  *** I created the account manually first time , because if the test need to be repeated then it makes sense to have
#  *** signed up account.
#************************************************************************************************************************** 
#  browser = Selenium::WebDriver.for :chrome

browser = Watir::Browser.new :chrome

#browser = Watir::Browser.new
browser.goto 'http://qa.dev1.axs.com/develop-axs/';
browser.link(:id, "myaxs-sign-in").click
browser.text_field(:name, "_username").set("testnaveen@yopmail.com")
browser.text_field(:name, "_password").set("edf7a6")
browser.send_keys :enter

# Assertions done to  check if i could login successfully
require "test/unit/assertions"
include Test::Unit::Assertions
begin
 assert(browser.link(:id, 'myaxs-email').exists?)

   puts "Logged into account succesfully".yellow
 rescue => e
   puts "oops!! cannot log in"
  end


browser.wait_until { browser.text.include? "Just Announced"}
begin
assert(browser.text_field(:xpath, "//*[@id='q']").exists?)
puts 'found  text'
if true
#=browser.text_field(:xpath, "//*[@id='q']")
browser.text_field(:xpath, "//*[@id='q']").clear


#t.clear
#t.set('Lakers')
browser.send_keys :enter
else
 
  puts "Not text box found"
end
end
#browser.link(:class, "follower")
#browser.link(:class=>"pl3 fl fs12", :xpath=>".//*[@id='spotlight_search']/div[5]/ul[1]/li[4]/div[2]/a/p").click;
#browser.image(:src, "//staticaws1.axs.com/bundles/aegaxs/images/icons/heart_13_follow.png?2.0.111/").click
#begin
# assert(browser.link(:class, "pl3 fl fs12", :xpath, ".//*[@id='spotlight_search']/div[5]/ul[1]/li[4]/div[2]/a/p").exists?)

 # puts "found the link"
#rescue => e
 #   puts "link not found"
#end


# I could not get directly to MyAlerts, running into issues like the element not visible.Did the click on the  
# account information and then got to 'My Alerts'
#browser.link(:href, "http://qa.dev1.axs.com/me/account").click
#browser.goto(browser.link(:text, "My Alerts").href)

# It is important to 'click the unfollow' before you complete the test, if not the second time it will fail
#begin
#   assert(browser.link(:text, "UNFOLLOW").exists?)
#    if true
#      puts "Unfollow button exists under My Alert tab"
#    else
#      puts "Unfollow button not found, please check your test"
#    end
# end

#browser.link(:text, "UNFOLLOW").click
#browser.close
#puts "Test is now complete".green


#*********************************************************************************************************************
# * Potential issue on test, if it fails to locate My Alert tab, need to clear browser , run the test second time which
# *may fail under webdriver browser, you need to manually 'unfollow the event', then run the script again
#**********************************************************************************************************************
                                                                                                                         

