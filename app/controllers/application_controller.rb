class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def is_admin?
    if (current_user.admin == true)
      true
    else
      redirect_to root_url
    end
  end

#end
  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def is_superuser_or_manager?
    if (current_user.user_type == "Manager" || "Super")
      true
    else
      redirect_to store_url
    end
  end

end