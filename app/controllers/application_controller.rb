class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default
  
  before_action :authenticate_user!
  def authorize_admin
    redirect_to :back, status: 401 unless current_user.admin
    #redirects to previous page
  end
  
  def redirect_to_default
    redirect_to root_path
  end
end
