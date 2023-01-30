# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password => Rails.application.credentials.dig(:sendgrid, :access_key), # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'tenancy-production.up.railway.app',
        :address => 'smtp.gmail.com',
        :port => 587,
        :authentication => :plain,
        :enable_starttls_auto => true
  }
  