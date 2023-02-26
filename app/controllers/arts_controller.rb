class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @arts = Art.all
    @categories = Category.all
  end

  def show
    @art = Art.find(params[:id])
    @booking = Booking.new
    @review = Review.new

    @to_time = Time.now

    @booked = params[:booked] == "true" if params[:booked]
    @reviewed = params[:reviewed] == "true" if params[:reviewed]
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user

    if Art.save
      redirect_to art_path(@art)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def art_params
    params.require(:art).permit(:photos, :title, :description, :price, :location, :height, :width)
  end
end
