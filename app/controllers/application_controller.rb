class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Stores the url before user had to sign in so they are redirected to where they
  # wanted to go after they sign in/up.
  before_action :store_user_location!, if: :storable_location? 
  before_action :authenticate_user!
  before_action :set_time_zone, if: :user_signed_in?
  # before_action :authenticate_admin!


  # around_action :switch_time_zone, :if => :current_user

  private

  def switch_time_zone(&block)
    # Time.use_zone(current_user.time_zone, &block)
  end

  def set_time_zone
    # Time.zone = current_user.time_zone
  end

  private
  # Its important that the location is NOT stored if:
  # - The request method is not GET (non idempotent)
  # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an 
  #   infinite redirect loop.
  # - The request is an Ajax request as this can lead to very unexpected behaviour.
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :current_password) }
  end


  # Method to filter listings by Make id. Association: Listing has a variant, which belongs
  # to a model, which belongs to a make.
  def view_by(make)
    @listings = Listing.includes(variant: :make).where(make: { id: make })
  end
end
