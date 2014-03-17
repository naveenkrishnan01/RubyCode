config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "google.com",
  :authentication =>"plain",
  :user_name => "naveenkrishnan01@gmail.com",
  :password => "aadhya99",
  :enable_starttls_auto => true
}
