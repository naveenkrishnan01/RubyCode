#!/usr/bin/env ruby
require 'rubygems'
require 'watir-webdriver'
require 'date'
load './test10.rb'

class Test < Env
 def init_param  param
  @param = get_env
end
end
d = Test.new
d.init_param @param
env = d.init_param @param

browser.close
