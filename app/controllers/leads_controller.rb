class LeadsController < ApplicationController
  def new
    @user = current_user
    @lead = @user.leads.build

  end

  def create
    lead = @user.leads.build
    @lead = current_user.leads.build( referee_id: params[:referee_id], referral_id: params[:referral_id])
    if @lead.save
      flash[:notice] = "Added lead."
      redirect_to root_url
    else
      flash[:error] = "Unable to add lead."
      redirect_to root_url
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    @lead.destroy
    flash[:notice] = "Removed lead."
    redirect_to current_user
  end
end