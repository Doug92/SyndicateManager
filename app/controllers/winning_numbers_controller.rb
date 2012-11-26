class WinningNumbersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :index, :show]
  #before_filter :is_admin?, only: [:edit, :update, :index, :show]
  before_filter :is_superuser_or_manager?, only: [:edit, :update, :index, :show]
  #  before_filter :correct_user,   only: [:edit, :update]

  # GET /winning_numbers
  # GET /winning_numbers.json
  def index
    @winning_numbers = WinningNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @winning_numbers }
    end
  end

  # GET /winning_numbers/1
  # GET /winning_numbers/1.json
  def show
    @winning_number = WinningNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @winning_number }
    end
  end

  # GET /winning_numbers/new
  # GET /winning_numbers/new.json
  def new
    @winning_number = WinningNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @winning_number }
    end
  end

  # GET /winning_numbers/1/edit
  def edit
    @winning_number = WinningNumber.find(params[:id])
  end

  # POST /winning_numbers
  # POST /winning_numbers.json
  def create
    @winning_number = WinningNumber.new(params[:winning_number])

    respond_to do |format|
      if @winning_number.save
        format.html { redirect_to @winning_number, notice: 'Winning number was successfully created. Good Luck!' }
        format.json { render json: @winning_number, status: :created, location: @winning_number }
      else
        format.html { render action: "new" }
        format.json { render json: @winning_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /winning_numbers/1
  # PUT /winning_numbers/1.json
  def update
    @winning_number = WinningNumber.find(params[:id])

    respond_to do |format|
      if @winning_number.update_attributes(params[:winning_number])
        format.html { redirect_to @winning_number, notice: 'Winning number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @winning_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winning_numbers/1
  # DELETE /winning_numbers/1.json
  def destroy
    @winning_number = WinningNumber.find(params[:id])
    @winning_number.destroy

    respond_to do |format|
      format.html { redirect_to winning_numbers_url }
      format.json { head :no_content }
    end
  end
end
