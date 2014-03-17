#!/usr/bin/env ruby

require 'rubygems'
require 'watir-webdriver'
require 'headless'
#require 'test/unit'

headless = Headless.new
headless.start
url = [ 
"http://www.oprah.com/packages/oprahs-book-club-2.html",
"www.oprah.com",
"www.oprah.com/oprahdotcom/13-Ways-You-Can-Join-the-Superstorm-Sandy-Relief-Effort-Right-now"]

url.each_with_index {|index|
b = Watir::Browser.start  "#{index}"
puts b.title 
b.close }

headless.destroy
