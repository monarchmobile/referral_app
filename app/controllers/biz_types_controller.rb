class BizTypesController < ApplicationController
  # GET /biz_types
  # GET /biz_types.json
  def index
    @biz_types = BizType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @biz_types }
    end
  end

  # GET /biz_types/1
  # GET /biz_types/1.json
  def show
    @biz_type = BizType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @biz_type }
    end
  end

  # GET /biz_types/new
  # GET /biz_types/new.json
  def new
    @biz_type = BizType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @biz_type }
    end
  end

  # GET /biz_types/1/edit
  def edit
    @biz_type = BizType.find(params[:id])
  end

  # POST /biz_types
  # POST /biz_types.json
  def create
    @biz_type = BizType.new(params[:biz_type])

    respond_to do |format|
      if @biz_type.save
        format.html { redirect_to @biz_type, notice: 'Biz type was successfully created.' }
        format.json { render json: @biz_type, status: :created, location: @biz_type }
      else
        format.html { render action: "new" }
        format.json { render json: @biz_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /biz_types/1
  # PUT /biz_types/1.json
  def update
    @biz_type = BizType.find(params[:id])

    respond_to do |format|
      if @biz_type.update_attributes(params[:biz_type])
        format.html { redirect_to @biz_type, notice: 'Biz type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @biz_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biz_types/1
  # DELETE /biz_types/1.json
  def destroy
    @biz_type = BizType.find(params[:id])
    @biz_type.destroy

    respond_to do |format|
      format.html { redirect_to biz_types_url }
      format.json { head :no_content }
    end
  end
end
