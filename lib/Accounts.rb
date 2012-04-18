require 'rubygems'
require 'httparty'

class Accounts
  include HTTParty
  format :json
  # debug_output $stderr

  def self.get_first_hundred
    return get_sforce_data_with_refresh('SELECT Name, Id from Account LIMIT 100')
  end

  def self.get_all_by_last_name(last_name)
    #TODO
  end

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url'] + "/services/data/v" + ENV['sfdc_api_version']
  end
  
  def self.get_sforce_data(query_string)
    set_headers
    return get(root_url + "/query/?q=#{CGI::escape(query_string)}")    
  end
  
  def self.logged_in
    !ENV['sfdc_token'].nil?
  end
  
  def self.auth_token_expired(response)
    return response.code == 401 && response[0]['errorCode'] == 'INVALID_SESSION_ID'
  end
  
  def self.refresh_auth_token
    refresh_response = post("https://login.salesforce.com/services/oauth2/token", {:body => {:grant_type => 'refresh_token', :refresh_token => ENV['sfdc_refresh_token'], :client_id => APP_CONFIG['key']}})
    ENV['sfdc_token'] = refresh_response['access_token']
    ENV['sf_update_time'] = Time.zone.now.to_s
    Rails.logger.info "Refreshed Auth Token"
  end
  
  def self.get_sforce_data_with_refresh(query_string)
    if logged_in
      Rails.logger.info "Requesting Salesforce data"
      response = get_sforce_data(query_string)
      if auth_token_expired(response)
        Rails.logger.info "Auth token expired"
        refresh_auth_token     
        response = get_sforce_data(query_string)
      end     
      return response
    else
      return "Not logged in to Salesforce"
    end
  end
  
end