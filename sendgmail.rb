require 'rubygems'
require 'time'
require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'gmail.com',
            :user_name            => 'naveenkrishnan01@gmail.com',
            :password             => 'jamesbond009',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end


Mail.deliver do
       to 'naveenroger@yahoo.com'
     from 'naveenkrishnan01@gmail.com'
  subject 'Automation '
     body File.read('test.txt')
   add_file '/home/naveen/RubyCode/test.txt'
end



