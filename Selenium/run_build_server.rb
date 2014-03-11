#!/usr/bin/env ruby
#
require 'rubygems'
require 'selenium-webdriver'
require_relative '../Global/setupconfig.rb'
require_relative '../Global/o20vars.rb'
#
#
file_name = ['bserver.rb', 'AppAdmin.rb',]
#
file_name.each do |file|
run_files_by_fname(file, dir = nil)
end
#
