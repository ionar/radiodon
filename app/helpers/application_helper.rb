module ApplicationHelper

	def uptime
  		time_ago_in_words(Radiodon::BOOTED_AT)
	end
	def bootstrap_class_for(flash_type)
		case flash_type
		when "success"
		"alert-success"
		when "error"
		"alert-warning"
		when "alert"
		"alert-danger"
		when "notice"
		"alert-info"
		else
		flash_type.to_s
		end
	end

	def active?(controller_name)
		servlet = params[:controller]
		if servlet == controller_name
			"active"
			else
			""
		end
	end

	def human_boolean(boolean)
    boolean ? t('sim') : t('não')
end
end
