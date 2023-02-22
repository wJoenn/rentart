class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.art = Art.find(params[:art_id])
    Booking.save
    redirect_to art_path(@booking.art)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address)
  end
end
