class RestaurantsController < ApplicationController
def show
  @restaurant = Restaurant.find_by_id params[:id]
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
    if @restaurant.save
      flash[:success] = "#{@restaurant.name} created"
      redirect_to @restaurant
    else
      flash[:warning] = @restaurant.errors.inspect
      redirect_to new_restaurant_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :description)
  end
end
