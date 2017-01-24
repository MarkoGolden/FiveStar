class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  && User.find(session[:user_id]).status.present?
  end
  helper_method :current_user

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || dynamic_root_path)
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

def dynamic_root_path
    if current_user.present?
      orders_path
    else
      root_path
    end
  end

end
