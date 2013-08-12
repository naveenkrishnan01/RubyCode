<<<<<<< HEAD
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
=======
require 'rubygems'
require 'time'
require 'net/smtp'
Net.instance_eval {remove_const :SMTPSession} if defined?(Net::SMTPSession)

require 'net/pop'
Net::POP.instance_eval {remove_const :Revision} if defined?(Net::POP::Revision)
Net.instance_eval {remove_const :POP} if defined?(Net::POP)
Net.instance_eval {remove_const :POPSession} if defined?(Net::POPSession)
Net.instance_eval {remove_const :POP3Session} if defined?(Net::POP3Session)
Net.instance_eval {remove_const :APOPSession} if defined?(Net::APOPSession)
require 'tlsmail'
    
content = <<EOF
From: naveenkrishnan01@gmail.com
To: naveenroger@yahoo.com
Subject: TEST IS NOW COMPLETE
Date: #{Time.now.rfc2822}\n
TEST
EOF
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', 'naveenkrishnan01@gmail.com', 'jamesbond009', :login) do |smtp|
      smtp.send_message(content, 'naveenroger@yopmail.com',
   'testmos@yopmail.com')
>>>>>>> 8c7669eb1e5349207a8600dfe4a9749f4ca37d46
end 
