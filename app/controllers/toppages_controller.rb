class ToppagesController < ApplicationController
  def index
    @agent = Agent.all
  end
end