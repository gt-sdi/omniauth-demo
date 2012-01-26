# Load the rails application
require File.expand_path('../application', __FILE__)

# as noted in http://devcenter.heroku.com/articles/omniauth-and-force-com
ENV['sfdc_api_version'] = '21.0'

# Initialize the rails application
OmniauthDemo::Application.initialize!


