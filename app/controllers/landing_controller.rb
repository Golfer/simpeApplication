class LandingController < ApplicationController
  def index
    @messages = Message.all
  end
end
