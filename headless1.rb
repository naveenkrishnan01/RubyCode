#!/usr/bin/env ruby

require 'rubygems'
require 'watir-webdriver'
require 'headless'
require 'json'

configuration = JSON.parse(File.read('./conf.json'))
url = configuration["url"]

headless = Headless.new
headless.start


b = Watir::Browser.start "#{url}"
puts b.title 
b.close


headless.destroy
