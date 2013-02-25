class ReferralsController < ApplicationController 
  # GET /referrals
  # GET /referrals.json
  def index
    @referrals = Referral.all 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @referrals }
    end 
  end

  # GET /referrals/1
  # GET /referrals/1.json
  def show
    @referral = Referral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @referral }
    end
  end

  # GET /referrals/new
  # GET /referrals/new.json
  def new
    @referral = Referral.new
    @referral.build_note
    lead_params
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @referral }
    end
  end

  # GET /referrals/1/edit
  def edit
    @referral = Referral.find(params[:id])
    @referee = @referral.referee
    @referee_id = @referral.referee.id
    @target = @referral.target
    @target_id = @referral.target.id
    lead_params
  end

  # POST /referrals
  # POST /referrals.json
  def create
    @referral = Referral.new(params[:referral])
    # @referral.notes.build
    @referee_id = params[:referee_id]
    @target_id = params[:target_id]
    respond_to do |format|
      if @referral.save
        # alert("#{@referee_id} and #{@target_id}")
        create_lead_relationship(@referee_id, @referral, @target_id)
        format.html { redirect_to @referral, notice: 'Referral was successfully created.' }
        format.json { render json: @referral, status: :created, location: @referral }
      else
        format.html { render action: "new" }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /referrals/1
  # PUT /referrals/1.json
  def update
    @referral = Referral.find(params[:id])

    respond_to do |format|
      if @referral.update_attributes(params[:referral])
        format.html { redirect_to @referral, notice: 'Referral was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referrals/1
  # DELETE /referrals/1.json
  def destroy
    @referral = Referral.find(params[:id])
    @referral.destroy

    respond_to do |format|
      format.html { redirect_to referrals_url }
      format.json { head :no_content }
    end
  end

  def create_lead_relationship(referee_id, referral, target_id)
    Lead.create!(referrer_id: current_user, referee_id: referee_id, referral_id: referral.id, target_id: target_id)
  end

  def lead_params
    if params[:referee_id]
      @referee_id = params[:referee_id] 
      @referee = User.find(@referee_id)
      @starts_with = 1
    end
    if params[:target_id]
      @target_id = params[:target_id]
      @target = User.find(@target_id) 
      @starts_with = 2
    end

    @users = current_user.associates if current_user
  end


  def send_referral
    @referral = Referral.find(params[:id])

    UserMailer.send_referral_to_referee(@referral).deliver
    UserMailer.send_referral_to_target(@referral).deliver

  end
end
