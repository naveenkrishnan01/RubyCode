#!/usr/bin/env ruby
require 'rubygems'
require 'selenium-webdriver'
require './createconfig.rb'

get_env()

start_browser()

get_url()


t = $driver.find_element(:id, 'cta-masthead-signup')
t.nil? ? display_msg("signup button not found") : display_msg("signup button found")
sleep 3;
display_msg("Test is now complete")

teardown()














