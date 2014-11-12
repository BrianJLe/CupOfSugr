class CategoriesController < ApplicationController
  def new
  end

  def create
  end

  def index
    @categories = Category.all 
  end

  def show
    Rails.logger.info("Param: #{params}")
    @category = Category.find(params[:id])
    @restaurants = Restaurant.where(:categories => {:id => params[:id]}).includes(:categories).all
    Rails.logger.info("Param1: #{@category.name}")
  end

  def destroy
  end

  def update
  end
end
