class RestaurantsController < ApplicationController

before_action :find_restaurant, :only => [:show, :edit, :update, :destroy]  

def show
  @current_reservations = Reservation.find_all_by_restaurant_id(@restaurant.id)
  cookies[:name] = @restaurant.name
  Rails.logger.info("RESL: #{@current_reservations.inspect}")
  if @restaurant
    render :show
  else
    flash[:warning] = "sorry that restaurant doesn't exist"
    redirect_to root_path
  end
end

  def index
     @restaurants = Restaurant.all
   end

  def new
    @restaurant = Restaurant.new
  end

  def create
    Rails.logger.info("Test:#{params.inspect}")
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    if @restaurant.save
      current_user.role = "owner"
      flash[:success] = "#{@restaurant.name} created"
      redirect_to @restaurant
    else
      flash[:warning] = @restaurant.errors.inspect
      redirect_to new_restaurant_path
    end
  end

  def edit
    if @restaurant
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @restaurant
      @restaurant.update_attributes(name: params[:restaurant][:name])
      flash[:success] = "Name Updated!"
      redirect_to restaurant_path @restaurant
    else
      flash[:alert] = "Houston, we have a problem"
      redirect_to root_path
    end
  end

  def destroy
        @restaurant = Restaurant.find_by_id params[:id]
    @restaurant.destroy
    redirect_to root_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :description, :city, :state)
  end

  protected    
  def find_restaurant
    @restaurant = Restaurant.find_by_id params[:id]
  end
end
