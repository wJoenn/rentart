class Arts::BuildController < ApplicationController
  before_action :disable_footer

  include Wicked::Wizard
  steps :new,
        :category,
        :location,
        :title_description,
        :price_size,
        :upload_photos

  def show
    @art = Art.find(params[:art_id])
    render_wizard
  end

  def update
    @art = Art.find(params[:art_id])
    @art.update(set_params) if params[:art]
    render_wizard @art
  end

  def create
    @art = Art.new
    @art.user = current_user
    @art.category = Category.first
    @art.save!
    redirect_to wizard_path(steps.first, art_id: @art.id)
  end

  private

  def disable_footer
    @disable = true
  end

  def set_params
    params[:art][:status] = step.to_s
    params[:art][:status] = "active" if step == steps.last
    params[:art][:category_id] = Category.find_by(name: params[:art][:category_id]).id if params[:art][:category_id]
    params.require(:art).permit(:title, :description, :status, :price, :height, :width, :location, :category_id, photos: [])
  end
end
