#!/usr/bin/env ruby

require 'rubygems'
require 'mail'

options = { :address              => "mail.smtp.com",
            :port                 => 25,
            :domain               => 'gmail.com',
            :user_name            => 'naveenkrishnan01@gmail.com',
            :password             => 'jamesbond009',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
 Mail.defaults do
  delivery_method :smtp, options
end

 mail = Mail.new do
      from 'naveenkrishnan01@gmail.com'
        to 'naveenkrishnan01@gmail.com'
   subject 'This is a test email'
        
 end

puts mail.to_s

