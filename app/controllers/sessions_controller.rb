require 'Accounts'

class SessionsController < ApplicationController
  def create
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['credentials']['instance_url']
    #render :text => request.env['omniauth.auth'].inspect
    render :text => Accounts.get_first_hundred.inspect
  end
end
