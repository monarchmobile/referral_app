class NotesController < ApplicationController

	def new
		@note = Note.new
		respond_to do |format|
	      format.js
	    end
	end

	def create 
		# @referral = Referral.find(params[:referral_id])
  		# @note = @referral.note.build(params[:note])
  		@note = Note.new(params[:note])

	    respond_to do |format|
	      if @note.save
	        format.js
	      else
	        format.html { render action: "new" }
	        format.json { render json: @note.errors, status: :unprocessable_entity }
	      end
	    end
	end

  protected
	def find_note
		@note = Note.find(params[:id])
	end

end