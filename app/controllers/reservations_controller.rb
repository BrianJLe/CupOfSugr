class ReservationsController < ApplicationController
  def index
  end

  def show
    @reservation = Reservation.find_by_id params[:id]
    if @reservation
      render :show
    else
      flash[:warning] = "sorry that reservation doesn't exist"
      redirect_to root_path
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    Rails.logger.info("Reserve: #{@reservation.inspect}")
          @restaurant = Restaurant.find_by_id(@reservation.restaurant_id)
    if @reservation.save
      ReservationMailer.confirm_email(@restaurant.user).deliver
      flash[:success] = "#{@reservation.id} created"
      redirect_to @reservation
    else
      flash[:warning] = @reservation.errors.inspect
      redirect_to new_reservation_path
    end
  end

  def new
    @reservation = Reservation.new
    Rails.logger.info("param: #{params.inspect}")
    @restaurant = Restaurant.find_by_id params[:restaurant_id]
    Rails.logger.info("Res: #{@restaurant.inspect}")
  end

  def update
  end

  def edit
  end

  def destroy
            @reservation = Reservation.find_by_id params[:id]
    @reservation.destroy
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:email, :message, :reserve_time, :reserve_date, :restaurant_id)
  end
end
