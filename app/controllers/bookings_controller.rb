class BookingsController < ApplicationController
  before_action :set_location, only: [:new, :create]
  before_action :set_booking, only: [:destroy, :update]

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
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def index
    @bookings = policy_scope(Booking)
    @bookings_as_owner = current_user.bookings_as_owner
    @bookings_as_renter = @bookings - @bookings_as_owner
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      @booking.delete if @booking.status == 'rejected'
      redirect_to bookings_path
    end
  end

  def destroy
    if @booking.destroy
      flash[:success] = 'Booking was successfully deleted.'
      redirect_to bookings_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to bookings_url
    end
  end
  

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
end
