class UsersController < ApplicationController
	before_filter :authenticate_user!
	def dashboard
		@restaurant = Restaurant.find_all_by_user_id(current_user.id)
	end

	def owner_dashboard
		@user = current_user
		@restaurants = current_user.restaurants
	end

	def my_stars
		@user = current_user
		@all_stars = @user.restaurants.starred_restaurants
	end
end
