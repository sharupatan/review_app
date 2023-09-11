class PrivateController < ApplicationController
  before_action :authenticate_user, except: [:login]

	def profile
		render json: current_user
	end
end