class StaticPagesController < ApplicationController
  def home
  	@user = current_user
  	
  end

  def profile
  end

  def about
  end
end
