#!/usr/bin/env ruby

require 'rubygems'
require 'pony'

def email
Pony.mail(:to => "naveenkrishnan01@gmail.com", :from => 'naveenkrishnan01@gmail.com', :headers => {'Content-Type' => 'text/html' }, :via => :smtp, :via_options => {
:address => 'smtp.gmail.com',
:port => '25',
:domain => 'gmail.com',
:user_name => 'naveenkrishnan01',
:password => 'aadhya99',
:authentication => :plain,
:enable_starttls_auto => true

},
 :subject => 'hi', :body => 'Hello there'
)
end 
