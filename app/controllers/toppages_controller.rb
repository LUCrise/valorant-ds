class ToppagesController < ApplicationController
  def index
    @agents = Agent.all
  end
end