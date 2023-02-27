class Arts::BuildController < ApplicationController
  include Wicked::Wizard
  steps :title_description_confirmation, :height_width_confirmation, :pricing_confirmation, :address_confirmation

  def show
    @art = Art.find(params[:art_id])
    render_wizard
  end

  def update
    @art = Art.find(params[:art_id])
    @art.update(set_params)
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

  def set_params
    params[:art][:status] = step.to_s
    params[:art][:status] = "active" if step == steps.last
    params.require(:art).permit(:title, :description, :status, :price, :height, :width, :location, photos: [])
  end
end
