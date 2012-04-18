require 'Accounts'

class AccountsController < ApplicationController
  def index
    @accounts = Accounts.get_first_hundred
  end
end