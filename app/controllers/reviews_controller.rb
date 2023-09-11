class ReviewsController < PrivateController
	include ReviewsHelper
	# load_and_authorize_resource
	
	def index
		@user = User.find_by(id: params[:user_id])
		render_user_error_or_reviews(@user)
	end

	def create
		@user = User.find_by(id: params[:user_id])
		render_success_or_user_error(@user)
	end

	def show
		@user = User.find_by(id: params[:user_id])
		render_review_or_user_error_message(@user)
	end

	def update
		@user = User.find_by(id: params[:user_id])
		render_user_error_or_update_message(@user)
	end

	def destroy
		@user = User.find_by(id: params[:user_id])
		render_user_error_or_success_message(@user)
	end

	private

	def review_params
		params.permit(:description)
	end
end