class WelcomeController < ApplicationController
  def index
  	@attends = Attend.where("clinic_id = ?", current_user.clinic_id)
  	@user = User.new
  end
end
