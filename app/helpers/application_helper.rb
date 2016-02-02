module ApplicationHelper

	def bootstrap_to_type(type)
		case type
		when 'alert' then 'danger'
		when 	'notice' then 'success'
		else type
		end
	end
	
	def alert_tag(type, message)
		content_tag :div, class: "alert alert-#{bootstrap_to_type(type)}" do
			message
		end
	end
end
