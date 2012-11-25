class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :show]
  before_filter :is_admin?, only: [:edit, :update, :index, :show]
  #before_filter :correct_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id]) #
                                   #
                                   #my_numbers = winning_number.find_by_winning_date(params[:id])
                                   #                                                         .where
                                   #
                                   #


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
 # def create
 #   @user = User.new(params[:user])
 #
 #   respond_to do |format|
 #     if @user.save
 #       format.html { redirect_to @user, notice: 'User was successfully created.' }
 #       format.json { render json: @user, status: :created, location: @user }
 #       #@add_syndicate
 #     else
 #       format.html { render action: "new" }
 #       format.json { render json: @user.errors, status: :unprocessable_entity }
 #     end
 #   end
 # end

  def create
     @user = User.new(params[:user])

     respond_to do |format|
       if @user.save
         format.html { redirect_to new_syndicate_url, notice: 'User was successfully created.' }
         format.json { render json: @user, status: :created, location: @user }
         #@add_syndicate
       else
         format.html { render action: "new" }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end
   end



  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end



  #def is_superuser_or_manager
  # @user_type = User.find_by_id(session[:user_type])
  # if @user_type == ("Super" || "Manager")
  #   true
  # else
  #   redirect_to(root_path)
  #    # redirect_to signin_url, notice: "Please sign in." unless superuser_or_manager?
  # end
  #end
  #def is_superuser_or_manager
   # if (current_user.user_type == "Member" || "Super")
  #    true
  #  else
  #    redirect_to store_url
  #  end
 # end

  #def correct_user
  #  @user = User.find(params[:id])
  #  redirect_to(root_path) unless current_user?(@user)
# end

end