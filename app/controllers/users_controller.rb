class UsersController < ApplicationController

  respond_to :html,:json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    find_user
    @received_referrals = @user.received_referrals
    @sent_referrals = @user.sent_referrals
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  def new
    @user = User.new
    @new_contact = params[:guest]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end


  def edit
    find_user
    social_networks = @user.social_networks
    affiliations = @user.affiliations
    addresses = @user.addresses
    phone_numbers = @user.phone_numbers
    emails = @user.emails

  end


  def create
    @user = User.new(params[:user])
    if params[:guest] == true
      User.new_guest
    else
      respond_to do |format|
        if @user.save
          add_user_to_contact_list(@user) if @user.guest?
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  def update
    find_user

    if @user.update_attributes(params[:user])
        respond_with @user
    else
        respond_to do |format|
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end


  def destroy
    find_user 
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def pass_referee_to_form
    @user = User.find(params[:id])
    @starts_with = params[:starts_with]
   
    
    respond_to do |format|
      format.js
    end
  end

  def pass_target_to_form
    @user = User.find(params[:id])
    @starts_with = params[:starts_with]
    
    
    respond_to do |format|
      format.js
    end
  end

  protected
    def find_user
     @user = User.find(params[:id])
    end

    def add_user_to_contact_list(user)
      Contact.create(user_id: current_user, associate_id: user.id)
    end
end
