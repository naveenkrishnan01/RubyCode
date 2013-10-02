#!/usr/bin/env ruby
require 'rubygems'
#require './checkarg'
require 'watir-webdriver'

require 'date'

class Test3
  def setup
  if ARGV[1] = 'ff'
   browser = Watir::Browser.new
  else if ARGV[1] = 'ie'
  browser = Watir::Browser.new :ie
  else
   browser = Watir::Browser.new :chrome
  end
 end

def teardown
  browser.close
end

 

