class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @arts = Art.all
    @categories = Category.all
    @arts = policy_scope(Art)
  end

  def show
    @art = Art.find(params[:id])
    @booking = Booking.new
    authorize @art

    @booked = params[:booked] == "true" if params[:booked]

    @art = Art.find(params[:id])
    @art.update(art_params)

    @art.destroy
    redirect_to arts_path, status: :see_other
  end

  def new
    @art = Art.new
    authorize @art
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user

    authorize @art

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
