class ArtsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def index
    Art.all
  end

  def new
    Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user = @user
    if Art.save
      # unsure if this is correct
      redirect_to user_path(@user)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def art_params
    params.require(:art).permit(:title, :description, :price, :location, :size, :category_id)
  end
end
