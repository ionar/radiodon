module AttendsHelper
	#Just experiments
  def dia_selected
    if params[:dia].present?
      return Date.parse(params[:dia])
    else
      return Date.current
    end
  end


	 def myclinic
    	render :text => current_user.clinic.fantasy_name
  	end

    def my_clinic_id
      return current_user.clinic.id
    end

  	def my_clinic_attends
  		my_attends  = Attends.all
  	end

  	def my_formatted_number number
    	number_to_currency(number, separator: ",", delimiter: "", format: '%n')
  	end

    def events_ajax_previous_link
      ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, :remote => true}
    end

    def events_ajax_next_link
      ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, :remote => true}
    end

end
