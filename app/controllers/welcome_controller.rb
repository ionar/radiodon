class WelcomeController < ApplicationController
  def index
  	@attends = Attend.all
  end
end
