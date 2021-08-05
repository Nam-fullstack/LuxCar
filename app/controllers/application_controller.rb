class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_admin!
  before_action :authenticate_user!
  before_action :set_time_zone, if: :user_signed_in?

  
  protected

  def set_time_zone
    # Time.zone = current_user.time_zone
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :current_password) }
  end
end
