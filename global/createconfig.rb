#!/usr/bin/ruby
require 'selenium-webdriver'


def init (env, br)
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
 

def teardown()
  $driver.quit
end
