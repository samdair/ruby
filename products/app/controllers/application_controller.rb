class ApplicationController < ActionController::Base
  #before_filter :authorize
  #before_filter :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def authorize
  unless logged_in? && current_user.admin?
    redirect_to( login_url, :notice => "Please log in")
  end
  end
end
