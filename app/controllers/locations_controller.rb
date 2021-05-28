class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query]
      @locations = policy_scope(Location).near(params[:query], 50)
      flash[:alert] = "No available locations. Showing all locations." if @locations.empty?
    else
      @locations = policy_scope(Location)
    end
     @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "info_window", locals: { location: location })
      }
    end
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new
    @show_calendar = show_calendar?
    authorize @location
  end

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
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

  def show_calendar?
    @location.user != current_user && !current_user.nil?
  end

  def location_params
    params.require(:location).permit(:name, :address, :price_per_day, :description, :capacity, :photo)
  end
end
