#!/usr/bin/env ruby
require 'rubygems'
require 'selenium-webdriver'
require './createconfig.rb'

get_env()

start_browser()

start_message($0)

DateTime_disp()

get_url()

begin
sleep 2;
 element_present(:id, 'cta-masthead-signup')

@t.nil? ? display_msg("signup button not found") : display_msg("signup button found")
sleep 3;

element_present(:xpath, ".//*[@id='hdr-sign-up']/button")
if @t.text.include? "Sign Up Free1"
  display_msg("found the text for Signup")
else
  display_msg("Text not found for Signup")
end 

element_present(:class, "jumbotron")
  puts @t.text
  puts " "

element_present(:class, "testimonials")
  puts @t.text
  puts " "

display_msg("Test is now complete")

teardown()
end
