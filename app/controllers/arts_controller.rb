class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.order(:name)
    if params[:search].present?
      @arts = Art.global_search(params[:search])
    else
      @arts = Art.all
    end
  end

  def show
    @art = Art.find(params[:id])
    @booking = Booking.new
    @review = Review.new

    if @art.reviews.any?
      @rating = @art.reviews.sum(&:rating).fdiv(@art.reviews.count).round(2)
      @rating = @rating.to_i if @rating == @rating.to_i
    end

    @to_time = Time.now

    @booked = params[:booked] == "true" if params[:booked]
    @reviewed = params[:reviewed] == "true" if params[:reviewed]
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy!
    redirect_to user_listings_path
  end

  private

  def art_params
    params.require(:art).permit(:photos, :title, :description, :price, :location, :height, :width)
  end
end
