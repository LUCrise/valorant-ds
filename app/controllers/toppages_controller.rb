class ToppagesController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index]
    
  def index
    @agents = Agent.all
  end
end