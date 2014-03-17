#!/usr/bin/env ruby

#require 'rubygems'

require 'watir-webdriver'
require 'webdriver-user-agent'
require 'colorize'
require 'date'

driver = Webdriver::UserAgent.driver(:browser => :firefox, :agent => :iphone,  :orientation => :landscape)
browser = Watir::Browser.new driver

browser.goto "www.axs.com"
browser.url.should == 'http://m.axs.com'

#browser.close
puts " Test is now complete ".green


