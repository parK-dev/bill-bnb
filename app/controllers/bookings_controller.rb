class BookingsController < ApplicationController
  before_action :set_location, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.location = @location
    if @booking.save
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def index
    @booking = Booking.all
  end

  def update
    @booking = Booking.find(params[:id])
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end


end
