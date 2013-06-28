#!/usr/bin/env ruby

require 'rubygems'
require 'tlsmail'  
require 'time' 
    
content = <<EOF
 From: naveenkrishnan01@gmail.com
    To: testmos@yopmail.com 
    Subject: TEST IS NOW COMPLETE 
    Date: #{Time.now.rfc2822}\n  
    TEST 
EOF
     
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)  
    Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', 'naveenkrishnan01@gmail.com', 'jamesbond009', :login) do |smtp|  
      smtp.send_message(content, 'naveenkrishnan01@gmail.com',
   'testmos@yopmail.com')
end 

