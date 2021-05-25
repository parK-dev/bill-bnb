class BookingsController < ApplicationController
  before_action :find_location, only: [:new, :create]
  # before_action :find_booking, only:

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.first #current_user
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

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_location
    @location = Location.find(params[:location_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end


end
