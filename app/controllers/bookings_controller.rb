class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.art = Art.find(params[:art_id])

    if @booking.save
      redirect_to art_path(@booking.art, booked: 'true')
    else
      redirect_to art_path(@booking.art, booked: 'false')
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address)
  end
end
