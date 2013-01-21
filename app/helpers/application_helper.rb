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

	def lorem_ipsum
		"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	end

	def primary(starts_with, referee, target)
		if starts_with == 1
			@referee_id = referee.id
		elsif starts_with == 2
			@target_id = target.id
		end
	end

	def highlight(start_with, num)
		if start_with == num
			"highlight"
		else
			""
		end
	end

	def primary_arrow?(starts_with)
		starts_with == 1
	end
# ###################### END Stock Methods END #######################

# ********************** START User START ********************

	def link_to_add_fields(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.id
	    fields = f.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_fields", f: builder)
	    end
	    link_to(name, '#', class: "add_fields add_rm_btns", data: {id: id, fields: fields.gsub("\n", "")})
	end
# ###################### END Referral END #######################
	def user_name_if_given(user)
		if user
			user.fullname
		else
			""
		end
	end

	def sent_or_received(referral, user)
		if referral.referrer.id == user.id
			"sent"
		elsif referral.referee.id == user.id 
			"received"
		end
	end

	def there_are_referrals(list)
		list.count > 0
	end

	def no_referrals_message(delivery)
	    content_tag :div, "You have no #{delivery} referrals at this time", class: "no_referrals"
	end

	def referenced_user(user)
		if user
			user.id
		else
			""
		end
		
	end

	def add_gray_out(field, value)
		if field == value
			""
		else
			"grayed_out"
		end
	end

	
 

####################### END Referral END ################

end