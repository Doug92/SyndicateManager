class SessionsController < ApplicationController

  def new

  end

  #trying to direct super to superuser home page  & manager to Syndicate page (& neither to sign in page)
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.manager && !user.admin #syndicate manager
      sign_in user
      #redirect_back_or user
      redirect_back_or users_url
      #redirect_to users_url
      #sign in
    elsif user && user.authenticate(params[:session][:password]) && !user.manager && user.admin #superuser
      sign_in user
      #redirect_back_or user
      redirect_to admin_url
    else
      #error and re render sign in form
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  #original below. above created on 26th Nov
  #def create
  #    user = User.find_by_email(params[:session][:email].downcase)
  #    if user && user.authenticate(params[:session][:password])
  #      sign_in user
  #      #redirect_back_or user
  #      redirect_back_or users_url
  #      #redirect_to users_url
  #      #sign in
  #    else
  #      #error and re render sign in form
  #      flash[:error] = 'Invalid email/password combination'
  #      render 'new'
  #    end
  #end

  def destroy
      sign_out
      redirect_to root_url
  end

end
