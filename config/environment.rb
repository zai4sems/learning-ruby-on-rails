# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrip.net',
    :port => '587',
    :authentication => :plain,
    :username => ENV['SENDGRIP_USERNAME'],
    :password => ENV['SENDGRIP_PASSWORD'],
    :domain => 'heroku.com',
    :enable_starttls_auto => true
}