class UsersController < PrivateController
	include UsersHelper
	# load_and_authorize_resource
	
	def index
		@users = User.all
		render json: @users
	end

	def create
		@user = User.new(user_params)
		render_success_or_error_message(@user)
	end

	def show
		@user = User.find_by(id: params[:id])
		render_user_or_error_message(@user)
	end

	def update
		@user = User.find_by(id: params[:id])
		render_updated_user_or_error_message(@user, user_params)
	end

	def destroy
		@user = User.find_by(id: params[:id])
		render_success_or_invalid_message(@user)
	end

	private

	def user_params
		params.permit(:name, :email, :password, :role)
	end
end