module AttendsHelper
	#Just experiments
  def dia_selected
    if params[:dia].present?
      return Date.parse(params[:dia])
    else
      return Date.current
    end
  end

  def apontamento(hora)
    hora = hora
    @atendimentos = @attends.where appointment: hora
    if (@atendimentos.length != 0)
      concatenada = ""
      @atendimentos.each do |consulta|
        if consulta.finalized == true
          concatenada << link_to("<span class='glyphicon glyphicon-check'></span> #{consulta.descriptive}".html_safe, consulta, class: "btn btn-success btn-xs margem-btn")
        else
          concatenada << link_to("<span class='glyphicon glyphicon-time'></span> #{consulta.descriptive}".html_safe, consulta, class: "btn btn-warning btn-xs margem-btn")
        end
        concatenada << " "        
      end
      ##Mostrar botao para adicionar mais um agendamento para o mesmo horario
      concatenada << link_to("<span class='glyphicon glyphicon-plus'></span>".html_safe, new_attend_path(:dia => dia_selected, :hora => hora), class: "btn btn-primary btn-xs margem-btn")
      
      return  "<span class='badge'>#{hora}</span> #{concatenada}".html_safe

      ##return "aqui tem #{@atendimentos.length} - #{concatenada}".html_safe + " <span class='badge'>#{hora}</span>".html_safe
    else
      return link_to("<span class='glyphicon glyphicon-calendar'></span>  <span class='glyphicon glyphicon-plus'></span>".html_safe, new_attend_path(:dia => dia_selected, :hora => hora), class: "btn btn-primary btn-xs") + " <span class='badge'>#{hora}</span>".html_safe
    end
  end

  #def apontamento(hora)
  #  @hora = hora
  #  consulta = @attends.find_by appointment: @hora
  #  if (consulta)
  #    if consulta.finalized == true
  #      return link_to "<span class='glyphicon glyphicon-check'></span> <span class='badge'>#{@hora}</span> #{consulta.patient.name}".html_safe, consulta, :class => "list-group-item list-group-item-action links-listagem list-group-item-info"
  #    else
  #      return link_to "<span class='glyphicon glyphicon-time'></span> <span class='badge'>#{@hora}</span> #{consulta.patient.name}".html_safe, consulta, :class => "list-group-item list-group-item-action links-listagem"      
  #    end
  #    
  #  else
  #    return link_to "<span class='glyphicon glyphicon-calendar'></span> <span class='badge'>#{@hora}</span> ...".html_safe, new_attend_path(:dia => dia_selected, :hora => @hora), :class => "list-group-item list-group-item-action links-listagem"
  #  end
  #end



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
