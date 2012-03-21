require 'Accounts'

class SessionsController < ApplicationController
  def create
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_refresh_token'] = request.env['omniauth.auth']['credentials']['refresh_token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['credentials']['instance_url']
    ENV['sf_update_time'] = Time.zone.now.to_s
    redirect_to :action => "index"
  end
end
