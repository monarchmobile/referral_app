class UserMailer < ActionMailer::Base
  default from: "Client@client_server.com"

  def password_reset(user)
	  @user = user
	  mail :to => user.email, :subject => "Password Reset"
  end

  def send_referral_to_referee(referral)
  	  @referral = referral
  	  @referrer = @referral.referrer
  	  @referee = @referral.referee
  	  @target = @referral.target
  	 
  	  mail :to => @referee.email, :subject => "This is a referral"
  end

  def send_referral_to_target(referral)
      @referral = referral
      @referrer = @referral.referrer
      @referee = @referral.referee
      @target = @referral.target
     
      mail :to => @target.email, :subject => "This is a referral"
  end

end