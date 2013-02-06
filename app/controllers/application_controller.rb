class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  def my_warm_ups
  	Referral.todays_warm_ups
  end
  helper_method :todays_warm_ups, :weeks_warm_ups, :months_warm_ups, :years_warm_ups

    def todays_warm_ups
		@todays_warm_ups = current_user.sent_referrals.where(warm_up_by: Date.today)
	end

	def weeks_warm_ups
		@weeks_warm_ups = current_user.sent_referrals.where(warm_up_by: Date.today.beginning_of_week..Date.today.end_of_week)
	end

	def months_warm_ups
		@months_warm_ups = current_user.sent_referrals.where(warm_up_by: Date.today.beginning_of_month..Date.today.end_of_month)
	end

	def years_warm_ups
		@years_warm_ups = current_user.sent_referrals.where(warm_up_by: Date.today.beginning_of_year..Date.today.end_of_year)
	end
  
  private

	def current_user
	    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end
	helper_method :current_user

	

end
