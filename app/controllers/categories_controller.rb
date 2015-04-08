class CategoriesController < ApplicationController
  def new
  end

  def create
  end

  def index
    @categories = Category.all 
  end

  def show
    @category = Category.find(params[:id])
    @restaurants = Restaurant.where(:categories => {:id => params[:id]}).includes(:categories).all
  end

  def destroy
  end

  def update
  end
end
