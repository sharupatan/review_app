class ApplicationController < ActionController::API
  include UsersHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    render json: 'You are not authorized!'
  end

  def profile
		render json: current_user
	end
end
