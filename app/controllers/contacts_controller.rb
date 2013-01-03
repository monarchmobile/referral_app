class ContactsController < ApplicationController

	def create
		@contact = current_user.contacts.build(user_id: params[:user_id], :associate_id => params[:associate_id])
		if @contact.save
		    flash[:notice] = "Added contact."
		    redirect_to root_url
		else
		    flash[:error] = "Unable to add contact."
		    redirect_to root_url
		end

	end



	def destroy

	end 

end 

