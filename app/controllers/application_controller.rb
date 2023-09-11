class ApplicationController < ActionController::API
  include UsersHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    render json: 'You are not authorized!'
  end
  
  def profile
		render json: current_user
	end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
    # devise_parameter_sanitizer.permit(:account_update, keys: %i[name role])
  end
end
