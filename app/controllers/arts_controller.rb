class ArtsController < ApplicationController

  def index
    @arts = Art.all
  end

  def show
    @arts = Art.find(params[:id])
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user
    if Art.save
      # unsure if this is correct
      redirect_to art_path(@art)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def art_params
    # photo is likely not correct
    params.require(:art).permit(:photo, :title, :description, :price, :location, :size, :category_id)
  end
end
