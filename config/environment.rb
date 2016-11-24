# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
   
    
    
    :address   => "smtp.sendgrid.net",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => ENV["SENDGRID_USERNAME"],
    :password  => ENV["SENDGRID_PASSWORD"], # SMTP password is any valid API key, when user_name is "apikey".
    :authentication => 'login',
    :domain => 'heroku.com',
}