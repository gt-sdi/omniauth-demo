require 'rubygems'
require 'httparty'

class Accounts
  include HTTParty
  format :json
  debug_output $stderr

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url'] + "/services/data/v" + ENV['sfdc_api_version']
  end

  def self.get_first_hundred
    if ENV['sfdc_instance_url']
      Accounts.set_headers
      response = get(Accounts.root_url + "/query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}")
      if response.code == 200
        return response
      else
        refresh_response = post("https://login.salesforce.com/services/oauth2/token", {:body => {:grant_type => 'refresh_token', :refresh_token => ENV['sfdc_refresh_token'], :client_id => APP_CONFIG['key']}})
        # puts refresh_response
        ENV['sfdc_token'] = refresh_response['access_token']
        ENV['sf_update_time'] = Time.zone.now.to_s
        Accounts.set_headers
        response = get(Accounts.root_url + "/query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}")
        return response
      end
    else
      return "Accounts Error: There is no instance URL"
    end
  end

  def self.get_all_by_last_name(last_name)
    #TODO
  end

end