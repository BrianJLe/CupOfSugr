class DashboardController < ApplicationController
  def index
    restaurant = Restaurant.all
    @reservations = restaurant
  end
end
