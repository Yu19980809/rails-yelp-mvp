class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
    @category = %w[chinese italian japanese french belgian]
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
