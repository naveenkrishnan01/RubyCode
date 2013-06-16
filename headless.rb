#!/usr/bin/env ruby

require 'rubygems'
require 'watir-webdriver'
require 'headless'
require 'test/unit'

headless = Headless.new
headless.start
url = ["www.oprah.com", "www.google.com"]

b = Watir::Browser.start "#{url[0]}"
puts b.title 
b.close



b = Watir::Browser.start "#{url[1]}"
puts b.title 
b.close


headless.destroy
