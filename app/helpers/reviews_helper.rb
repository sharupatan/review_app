module ReviewsHelper
	def render_success_or_error_message(review)
		if review.save
			render json: 'review added successfully!'
		else
			render json: review.errors.full_messages
		end
	end

	def render_user_error_or_reviews(user)
		if user.nil?
			render json: 'user with id not found!'
		else
			@reviews = user.reviews
			render_review_error_or_reviews(@reviews)
		end
	end

	def render_review_error_or_reviews(reviews)
		if reviews.nil? || reviews.empty?
			render json: 'reviews not found!'
		else
			render json: reviews
		end
	end

	def render_success_or_user_error(user)
		if @user.nil?
			render json: 'user with id not found!'
		else
			@review = @user.reviews.new(review_params)
			render_success_or_error_message(@review)
		end
	end

	def render_user_error_or_success_message(user)
		if user.nil?
			render json: 'user with id not found!'
		else
			@review = user.reviews.find_by(id: params[:id])
			if @review.nil?
				render json: 'review with id not found!'
			else
				@review.destroy
				render json: 'review removed successfully!'
			end
		end
	end

	def render_review_or_user_error_message(user)
		if user.nil?
			render json: 'used with id not found!'
		else
			@review = user.reviews.find_by(id: params[:id])
			if @review.nil?
				render json: 'review with id not found!'
			else
				render json: @review
			end
		end
	end

	def render_user_error_or_update_message(user)
		if user.nil?
			render json: 'user with id not found!'
		else
			@review = user.reviews.find_by(id: params[:id])
			if @review.nil?
				render json: 'review with id not found!'
			else
				@review.update(review_params)
				render json: "review id updated successfully! #{@review}"
			end
		end
	end
end