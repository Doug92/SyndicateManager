class LotterySelectionsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :show]
  before_filter :is_admin?, only: [:edit, :update, :index, :show]
    #before_filter :correct_user, only: [:edit, :update]
  # GET /lottery_selections
  # GET /lottery_selections.json
  def index
    @lottery_selections = LotterySelection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lottery_selections }
    end
  end

  # GET /lottery_selections/1
  # GET /lottery_selections/1.json
  def show
    @lottery_selection = LotterySelection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lottery_selection }
    end
  end

  # GET /lottery_selections/new
  # GET /lottery_selections/new.json
  def new
    @lottery_selection = LotterySelection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lottery_selection }
    end
  end

  # GET /lottery_selections/1/edit
  def edit
    @lottery_selection = LotterySelection.find(params[:id])
  end

  # POST /lottery_selections
  # POST /lottery_selections.json
  def create
    @lottery_selection = LotterySelection.new(params[:lottery_selection])

    respond_to do |format|
      if @lottery_selection.save
        format.html { redirect_to @lottery_selection, notice: 'Lottery selection was successfully created.' }
        format.json { render json: @lottery_selection, status: :created, location: @lottery_selection }
      else
        format.html { render action: "new" }
        format.json { render json: @lottery_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lottery_selections/1
  # PUT /lottery_selections/1.json
  def update
    @lottery_selection = LotterySelection.find(params[:id])

    respond_to do |format|
      if @lottery_selection.update_attributes(params[:lottery_selection])
        format.html { redirect_to @lottery_selection, notice: 'Lottery selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lottery_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lottery_selections/1
  # DELETE /lottery_selections/1.json
  def destroy
    @lottery_selection = LotterySelection.find(params[:id])
    @lottery_selection.destroy

    respond_to do |format|
      format.html { redirect_to lottery_selections_url }
      format.json { head :no_content }
    end
  end
end
