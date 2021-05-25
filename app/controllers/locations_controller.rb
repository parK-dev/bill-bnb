class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = policy_scope(Location)
  end

  def show
    @location = Location.find(location_params)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    if @location.save
      flash[:success] = "Location successfully created"
      redirect_to @location
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  private

  def location_params
    params.require(:location).permit(:user_id, :name, :address, :price_per_day, :description, :capacity)
  end
end
