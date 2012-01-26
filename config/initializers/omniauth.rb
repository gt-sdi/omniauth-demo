APP_CONFIG = YAML.load_file("#{Rails.root}/config/omniauth.yml")

# note: you will have to change this url when you deploy to your production environment
OmniAuth.config.full_host = 'https://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, APP_CONFIG['key'], APP_CONFIG['secret']
end