class WelcomeController < ApplicationController
  def index
  	@attends = Attend.where("clinic_id = ?", current_user.clinic_id)
  	@user = User.new
  	@datasel = params[:data]
  end
end
