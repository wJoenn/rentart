class BookingsController < ApplicationController
  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.art = Art.find(params[:art_id])
    if Booking.save
      redirect_to art_path(@booking.art)
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :address)
  end
end
