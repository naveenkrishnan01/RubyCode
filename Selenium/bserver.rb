#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'
require_relative '../Global/setupconfig.rb'
require_relative '../Global/o20vars.rb'

CurrentVars = O20Vars.new

printTime("Start:")

startDriver()

test_pages = ["HOMEPAGE", "OWNTV", "OMAG", "VIDEOS", "BOOKS", "QUOTABLES", "LIFECLASS", "SUPERSOULSUNDAY", "NEXTCHAPTER", "LATOYA", "OWNERS", "INSPIRATION", "IYANLA", "HEALTH"]

test_urls = {}
test_pages.each do |test_page|
	  test_urls[test_page] = CurrentVars.getVar(test_page)
end

test_urls.each do |page_name, url|

open(getEnv() + url)
sleep (3)

driver = getCurrentDriver()
@status = false	


begin
   if page_name == "INSPIRATION"
   tabs = driver.find_element(:xpath, ".//*[@id='page_tab_nav']/ul/li[3]")
   puts " "
   puts "The Intrest APP INSPIRATION"
   puts "The #{page_name} Tab found for " + " " + tabs.text
   result =  tabs.nil? ? "FAIL" : "PASS"
   puts "RESULTS:" + result
   puts " "
   sleep 3;
  end
 
   if page_name == "IYANLA"
   episode = driver.find_element(:xpath, ".//*[@id='section2']/div[3]/div[2]/div[2]/div/article[1]/figure/a/img").location_once_scrolled_into_view
   sleep 2;
   episode = driver.find_element(:xpath, ".//*[@id='section2']/div[3]/div[2]/div[2]/div/article[1]/figure/a/img")
   sleep 3;
   episode.click;
   puts "The episode page #{page_name} is clicked" + " " + driver.current_url 
   result =episode.nil? ? "FAIL" : "PASS"
   puts "RESULTS:" + result
   puts " "
   sleep 3;
  end   

 if page_name == "HEALTH"
       all_imgs = getElements("xpath" => '//h3[contains(@class, "title")]')
           randnum = Random.new.rand(1..all_imgs.count)
           img_to_click = all_imgs[randnum]
              until img_to_click.displayed?
           randnum = Random.new.rand(1..all_imgs.count)
            img_to_click = all_imgs[randnum]
       end
              puts "The extended article page clicked is "+ " " + img_to_click.text
	      result = img_to_click.nil? ? "FAIL" : "PASS"
              puts "RESULTS:" + result
	      puts " "
       	      img_to_click.click
                sleep (5)
 end

  if page_name != "INSPIRATION" && page_name != "IYANLA" && page_name != "HEALTH"
    if page_name == "NEXTCHAPTER"
     puts "Page loads for #{page_name}" + " " + "(Renamed as OPRAH PRIME SHOW)"
    else     
    puts "Page loads for #{page_name}"
   end
  end  
rescue => e
 puts "Issue with the  page #{page_name}"
end 
end


#teardown
 @status = "true"
  if ARGV[1] == 'local'
   endTest()
   printTime("End:")
  exit
 end

##teardown for the saucelab 
setTestStatus(@status)
endTest()
printTime("End:")
