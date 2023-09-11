class PublicController < ApplicationController
	include UsersHelper

	def index
		render json: 'this is home page'
	end

	def not_found
		render json: 'page not found / 404 error!'
	end
end