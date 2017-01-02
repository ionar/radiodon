module AttendsHelper
	#Just experiments
  def data_selecionada
   render :text => params[:data]
  end

	def myclinic
    	render :text => current_user.clinic.fantasy_name
  	end

  	def my_clinic_attends
  		my_attends  = Attends.all
  	end

  	def my_formatted_number number
    	number_to_currency(number, separator: ",", delimiter: "", format: '%n')
  	end

    def events_ajax_previous_link
      ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, remote: :true}
    end

    def events_ajax_next_link
      ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, remote: :true}
    end
end
