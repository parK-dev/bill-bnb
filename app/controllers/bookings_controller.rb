class BookingsController < ApplicationController
  before_action :find_location
  before_action :find_booking

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.location_id = @location.id
    if @booking.save
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :location_id)
  end

  def find_location
    @location = Location.find(params[:id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end


end
