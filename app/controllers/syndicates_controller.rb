class SyndicatesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :show]
    before_filter :is_admin?, only: [:edit, :update, :index, :show]
  # GET /syndicates
  # GET /syndicates.json
  def index
    @syndicates = Syndicate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @syndicates }
    end
  end

  # GET /syndicates/1
  # GET /syndicates/1.json
  def show
    @syndicate = Syndicate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @syndicate }
    end
  end

  # GET /syndicates/new
  # GET /syndicates/new.json
  def new
    @syndicate = Syndicate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @syndicate }
    end
  end

  # GET /syndicates/1/edit
  def edit
    @syndicate = Syndicate.find(params[:id])
  end

  # POST /syndicates
  # POST /syndicates.json
  def create
    @syndicate = Syndicate.new(params[:syndicate])

    respond_to do |format|
      if @syndicate.save
        format.html { redirect_to @syndicate, notice: 'Syndicate was successfully created.' }
        format.json { render json: @syndicate, status: :created, location: @syndicate }
        ApproveSyndicate.new_syndicate_email(@syndicate).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @syndicate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndicates/1
  # PUT /syndicates/1.json
  def update
    @syndicate = Syndicate.find(params[:id])

    respond_to do |format|
      if @syndicate.update_attributes(params[:syndicate])
        format.html { redirect_to @syndicate, notice: 'Syndicate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @syndicate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndicates/1
  # DELETE /syndicates/1.json
  def destroy
    @syndicate = Syndicate.find(params[:id])
    @syndicate.destroy

    respond_to do |format|
      format.html { redirect_to syndicates_url }
      format.json { head :no_content }
    end
  end
end
