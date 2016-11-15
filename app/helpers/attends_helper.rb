module AttendsHelper
	#Just experiments
	def myclinic
    	render :text => current_user.clinic.fantasy_name
  	end

  	def my_clinic_attends
  		my_attends  = Attends.all
  	end

  	def my_formatted_number number
    	number_to_currency(number, separator: ",", delimiter: "", format: '%n')
  	end
end
