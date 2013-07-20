#!/usr/bin/env ruby

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
                                                                                                                         

