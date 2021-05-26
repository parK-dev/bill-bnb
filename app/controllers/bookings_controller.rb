class BookingsController < ApplicationController
  before_action :set_location, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.location = @location
    authorize @booking
    if @booking.save
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def index
    @bookings = policy_scope(Booking)
    @bookings_as_owner = current_user.bookings_as_owner
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
end
