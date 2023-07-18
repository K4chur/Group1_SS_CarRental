class CarsController < ApplicationController
  before_action :set_car, only: %i[ edit update destroy]
  before_action :authenticate_user!

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/search
  def search
    @cars = Car.where('daily_price >= ?', params[:price_from])
              .where('daily_price <= ?', params[:price_to])
              .where(fuel_type: params[:fuel_type])
              .where(gearbox: params[:gearbox])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:brand, :model, :engine_capacity, :gearbox , :fuel_type, :daily_price, :fuel_consumption, :img)

    end
end
