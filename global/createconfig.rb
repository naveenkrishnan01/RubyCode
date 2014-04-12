#!/usr/bin/ruby
require 'selenium-webdriver'


def init (env, br, name)
 @environment = env
 @browser     = br
end

def get_env()
   if ARGV[0] != "prod"
     puts "Please pass prod as argument"
     exit 
   else
      env = "prod"
   end 
  return env
end

def get_browser
   browser = "firefox"
  return browser
end

def start_message(name)
  @name = name
  puts "Test begins for script #{name}"
  puts " "
end


def DateTime_disp()
 puts "Starting Time now #{Time.now}"
end

$driver = nil
def start_browser()
   $driver = Selenium::WebDriver.for :firefox
end

def get_url()
   $driver.get 'http://www.payoff.com'
end

def display_msg(message)
 @msg = message
puts @msg
end

def element_present(how, what)
@t = $driver.find_element(how, what)
  true
  puts " "
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
  false
  puts e.message
  puts " "
 end   

def teardown()
  $driver.quit
end

#def error_handling()
 # rescue Selenium::WebDriver::Error::NoSuchElementError => e
#   puts e.message
#  end


