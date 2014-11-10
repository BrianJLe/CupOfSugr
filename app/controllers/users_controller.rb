class UsersController < ApplicationController
	before_filter :authenticate_user!
	def dashboard
		Rails.logger.info("Play: #{current_user.id.inspect}")
		@restaurant = Restaurant.find_all_by_user_id(current_user.id)
		Rails.logger.info("Pla: #{@restaurant.inspect}")
	end

	def owner_dashboard
  		@user = current_user
  		@restaurants = current_user.restaurants
  	end

    def patron_dashboard
      @user = current_user
     # @restaurants = current_user.starred_restaurants
    end
end
