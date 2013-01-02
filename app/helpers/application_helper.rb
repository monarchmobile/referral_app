module ApplicationHelper
# ********************** START Stock Methods START ********************
	def question_for_andrew(text)
		content_tag(:div, text, class: "andrew")
	end

	# user methods
	def restrict_access
		redirect_to root_url, notice: "access denied"
	end

	def current_users_page?(user)
    	current_user && current_user.id == user.id
    end

    # generates red stars for required fields in any form
	def required_field
		content_tag :span, "**", class: "required_field"
	end
# ###################### END Stock Methods END #######################

# ********************** START User START ********************

	def link_to_add_fields(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.id
	    fields = f.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_fields", f: builder)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end
# ###################### END User END #######################
end