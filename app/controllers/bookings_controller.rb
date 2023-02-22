class BookingsController < ApplicationController
  def create
    @booking = Booking.art(bookings_params)
    @booking.user = current_user
    if Booking.save
      redirect_to art_path(@booking.art)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :address)
  end
end
